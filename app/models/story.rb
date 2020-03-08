class Story < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  #Display not-deleted stories
  default_scope { where(deleted_at: nil )}

  def destroy
    self.update(deleted_at: Time.now)
  end
end
