class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users_that_liked, through: :likes, source: :user

  validates_presence_of :description
  validates_presence_of :board

  has_attached_file :pin_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pin_image, content_type: /\Aimage\/.*\Z/


  def repost(user)
    repost_pin = self.dup
    repost_pin.user_id = user.id
    repost_pin.pin_image = self.pin_image
    repost_pin.original_pin_id = self.id
    repost_pin.save
  end

  def is_repost?
    original_pin_id.present?
  end

  def original_post
    Pin.find(original_pin_id) if is_repost?
  end
end
