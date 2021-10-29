class Reaction < ApplicationRecord
  TYPES_LIST = %w(hug clap heart)

  belongs_to :user
  belongs_to :reactable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:reactable_id, :reactable_type] }
end
