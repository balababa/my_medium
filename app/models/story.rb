require "babosa"
class Story < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidate, use: :slugged
  include AASM
  
  
  # relationship
  belongs_to :user
  has_one_attached :cover_image

  # validation
  validates :title, presence: true


  # scopes
  default_scope { where(deleted_at: nil )}
  scope :published_stories, -> { where(status: :published) }

  # instance_methods
  def destroy
    self.update(deleted_at: Time.now)
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  aasm(column: :status, no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
      after do
        puts "簡訊通知"
      end
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

  private
  def slug_candidate
    [
      :title,
      [:title, SecureRandom.hex[0, 8]]
    ]
  end

end
