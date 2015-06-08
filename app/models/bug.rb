class Bug < ActiveRecord::Base
	attr_accessible :title,:deadline,:description,:typ,:status,:image,:project,:creator_id


    has_many :solvers
    has_many :users, through: :solvers

     accepts_nested_attributes_for :solvers


   belongs_to :project

    mount_uploader :image ,ImageUploader
    
	validates :title, presence: true,  uniqueness: true
	validates :typ, presence: true
	validates :status, presence: true
	validates :image, allow_blank: true, format: {
    with: %r{\.(gif|png)\z}i,
    message: 'must be a GIF or PNG'
  }, if: :filename_has_extension?

  def filename_has_extension?
    image =~ /\./
  end
end
