class Box < ActiveRecord::Base
	belongs_to :project
	belongs_to :bug

	
end
