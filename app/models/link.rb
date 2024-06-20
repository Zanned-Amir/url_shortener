class Link < ApplicationRecord
  belongs_to :user , optional: true
  has_many :views , dependent: :destroy
  scope :recent_first, -> { order(created_at: :desc) }

  after_save_commit  if: :url_previously_changed? do

    MetadataJob.perform_later(to_param)
  end



  validates :url , presence: true
  def  self.find_by_short_code(short_code)
     find ShortCode.decode(short_code)
  end

  def self.find(id)
    super (id.is_a?(Integer) ? id: Shortcode.decode(id))
  end

  def to_param
    ShortCode.encode(id)
  end

  def domain
    URI(url).host
  rescue URI::InvalidURIError

  end
  # check if  link editable  by user
  def editable_by?(user)
    user_id? && user_id == user&.id
  end
end
