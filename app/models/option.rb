class Option < ActiveRecord::Base
  belongs_to :noodle
  has_many :votes, dependent: :destroy
end
