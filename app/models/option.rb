class Option < ActiveRecord::Base
  belongs_to :noodle
  has_many :votes, dependent: :destroy

  default_scope { order(created_at: :asc) }
end
