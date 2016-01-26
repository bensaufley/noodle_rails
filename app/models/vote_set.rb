class VoteSet < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :noodle_id }
  belongs_to :noodle
  has_many :votes, dependent: :destroy
  accepts_nested_attributes_for :votes

  default_scope { includes(:votes).order(created_at: :asc) }
end
