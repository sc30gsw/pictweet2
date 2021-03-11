class Tweet < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :user_id
  end
  belongs_to :user
end
