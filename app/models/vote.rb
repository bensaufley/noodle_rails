class Vote < ActiveRecord::Base
  belongs_to :vote_set
  belongs_to :option

  default_scope { includes(:vote_set).order('vote_sets.created_at ASC') }
end
