class Comment < ApplicationRecord
  extend ActsAsTree::TreeView

  acts_as_tree order: :body, counter_cache: true

  belongs_to :user
  belongs_to :post
  has_many :reactions, as: :reactable, dependent: :destroy

  validates :body, presence: true
  validate :validate_parent
  validate :validate_post
  validate :check_deep_level

  private
    def validate_parent
      if parent_id
        errors.add(:parent, 'does not exist') unless parent.present?
      end
    end

    def validate_post
      return unless parent.present?

      errors.add(:post, "does not match with parent's post") if parent.post_id != self.post_id
    end

    def check_deep_level
      errors.add(:comment, 'cannot be added to a sub comment') if parent.present? && parent.parent.present?
    end
end
