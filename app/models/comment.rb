class Comment < ActiveRecord::Base

  validates_presence_of :content
  belongs_to :post
  belongs_to :user

  def user_name
    self.try(:user).try(:username)
  end

end
