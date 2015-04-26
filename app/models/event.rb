class Event < ActiveRecord::Base
  has_many :guests
  belongs_to :user
end
