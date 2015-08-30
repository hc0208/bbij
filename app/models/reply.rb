class Reply < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user
  validates_presence_of :text
end
