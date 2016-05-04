class Vote < ActiveRecord::Base
  belongs_to :vote_set
  belongs_to :option

  default_scope { includes(:vote_set, :option).order('options.created_at ASC') }
end
