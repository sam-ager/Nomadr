class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :name, uniqueness: true #username must be unique

        has_many :posts #User has many posts
        has_many :comments #user has many comments

        has_attached_file :avatar, :default_url => "/images/profile.png" #User has a profile picture
  		validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ #Image needs to be a valid image file
  		
end
