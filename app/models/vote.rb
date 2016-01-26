class Vote < ActiveRecord::Base
  belongs_to :vote_set

  default_scope { includes(:vote_set).order('vote_sets.created_at ASC') }
end
