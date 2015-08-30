class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates_presence_of :text
end
