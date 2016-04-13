class Post < ActiveRecord::Base
	
	acts_as_votable
	belongs_to :user #Post belongs to user
	validates :user_id, presence: true #Post has to associate to user id
	has_attached_file :image #Post can have image
 	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/ #Image needs to be a valid image file
 	validates :description, presence: true #Posts has to have description
 	has_many :comments #Post can have many comments
 	has_attached_file :avatar #User profile photo is attached to post
end
