class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible  :name,:email, :password , :password_confirmation ,:cat

 	  has_many :businesses
     has_many :projects, through: :businesses

     has_many :creators
     has_many :bugs, through: :creators
     
  
    validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true


  validates :name, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
end
