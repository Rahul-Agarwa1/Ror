class User < ApplicationRecord
  before_save {self.email = email.downcase}  #self is refrencing to the object of the class
  has_many :articles, dependent: :destroy
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: { minimum: 3, maximum: 25 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   #anything capital in ruby is a constant, so here VALID_EMAIL_REGEX is a constant
   validates :email, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: { maximum: 105 },
                       format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
