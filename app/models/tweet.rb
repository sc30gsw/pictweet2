class Tweet < ApplicationRecord
  validates :name, presence: true
end
