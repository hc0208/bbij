class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :tweets
  has_many :replies, ->{ order("updated_at DESC") }

  has_attached_file :avatar, styles: { medium: "50x50#", thumb: "50x50#"}
  validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png)

end
