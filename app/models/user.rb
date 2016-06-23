class User < ActiveRecord::Base
  #Validate email format
  validates :email, :format => { :with => /\A[a-zA-z]{2,}[@][a-zA-z]+[.].{2,}\z/}
  #Validate email uniquenes
  validates :email, :uniqueness => true
  #Validate age over 18
  validates_numericality_of :age, :greater_than_or_equal_to => 18
  #Validate Phone numbers con custom methods
  validate :phone_number

#Implementa los métodos y validaciones de tu modelo aquí. 
  def name
     p "#{self.first_name} #{self.last_name}"
  end

  def age
    now = Time.now.utc.to_date
    p now.year - self.birthday.year - (self.birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
  
  def phone_number
    x = self.phone.count "1234567890"
    # p "X en phone number"
    # p x
    if x < 10
      errors.add(self.phone, "Can't have less than 10 numbers")
    end
    # p "Terminé phone_number"
  end

end 


