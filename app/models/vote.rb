class Vote < ActiveRecord::Base
  belongs_to :vote_set
  belongs_to :option

  default_scope { includes(:vote_set, :option).order('vote_sets.created_at ASC, options.created_at ASC') }
end
