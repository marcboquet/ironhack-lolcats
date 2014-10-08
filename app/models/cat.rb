class Cat < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :owner

  mount_uploader :picture, # name of the database field
                 CatPictureUploader
end
