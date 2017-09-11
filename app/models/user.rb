class User < ActiveRecord::Base

   before_save { self.email = email.downcase } #Makes sure email is low case
   validates :firstname, presence: true, length: { maximum: 30 } #Username msut be present and length max 30
   validates :lastname, presence: true, length: { maximum: 30 } #Username msut be present and length max 30
   validates :address, presence: true, length: { maximum: 100}, allow_nil: false
   validates :postcode, presence: true, length: { maximum: 10}, allow_nil: false
   validates :contact, presence: true, length: { maximum: 11}, allow_nil: false
   validates :password, presence: true, length: { minimum: 5}, allow_nil: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   
   validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },
                    #Tests with the format, string comparison
                    uniqueness: { case_sensitive: false }
                    #Uniqueness not case senitive
                    

   has_secure_password

end
