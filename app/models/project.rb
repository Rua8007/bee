class Project < ActiveRecord::Base
	attr_accessible :name,:description


    has_many :businesses
    has_many :users, through: :businesses


    
    has_many :bugs





	validates :name, presence: true, length: { maximum: 20 }	
	validates :description, presence: true, length: { maximum: 70 }
	# validates :user_id, presence: true
end
