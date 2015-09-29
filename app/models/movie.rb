class Movie < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, :dependent => :destroy

  attr_accessor :video_file

  has_attached_file :video_file

#validates_attachment_content_type :image,:video_file, :content_type => %w(image/jpeg image/jpg  image/png video/mp4) 
validates_attachment_content_type :video_file ,:content_type => %w(video/mp4)

has_attached_file :image, :styles => { :medium => "400x400>" }
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
 # validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

def self.search(search)
  if search
    where('title LIKE ?', "%#{search}%")
  else
    all
  end
end




end
