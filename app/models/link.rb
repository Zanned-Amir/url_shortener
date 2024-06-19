class Link < ApplicationRecord
  has_many :views , dependent: :destroy
  scope :recent_first, -> { order(created_at: :desc) }

  after_save_commit  if: :url_previously_changed? do

    MetadataJob.perform_later(to_param)
  end



  validates :url , presence: true

  def self.find(id)
    super ShortCode.decode(id)
  end

  def to_param
    ShortCode.encode(id)
  end

  def domain
    URI(url).host
  rescue URI::InvalidURIError

  end
end
