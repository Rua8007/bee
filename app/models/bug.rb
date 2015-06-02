class Bug < ActiveRecord::Base
	attr_accessible :title,:deadline,:description,:typ,:status


     has_many :businesses
     has_many :users, through: :businesses


validates :title, presence: true, length: { maximum: 20 }	
validates :description, presence: true, length: { maximum: 70 }
validates :typ, presence: true, length: { maximum: 20 }
validates :status, presence: true, length: { maximum: 20 }
end
