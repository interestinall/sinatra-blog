class Post < ActiveRecord::Base

  belongs_to :user 
  validates_presence_of :title, :content
  has_many :comments

end