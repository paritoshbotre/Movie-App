class Movie < ActiveRecord::Base
  #associations
  belongs_to :user
  has_many :reviews


  mount_uploader :image, ImageUploader
  has_attached_file :avatar, styles: { medium: "200x400"}
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
