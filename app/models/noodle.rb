class Noodle < ActiveRecord::Base
  validates :name, :email, presence: true
  before_create :create_uuid
  has_many :options, dependent: :destroy
  has_many :vote_sets, dependent: :destroy
  has_many :votes, through: :vote_sets

  default_scope { includes(:options) }

  def to_param
    uuid
  end

  private
  def create_uuid
    while self.uuid.blank? || Noodle.find_by(uuid: self.uuid).present?
      self.uuid = SecureRandom.hex(16)
    end
  end
end
