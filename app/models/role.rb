class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map{ |aud| aud.actor }
    end

    def locations
        self.auditions.map{ |aud| aud.location }
    end

    def lead
        first_hire = self.auditions.find_by(hired: true)
        first_hire ? first_hire : "no actor has been hired for this role"    
    end

    def understudy
        second_hire = self.auditions.where(hired: true).second
        second_hire ? second_hire : 'no actor has been hired for understudy for this role'
    end


end