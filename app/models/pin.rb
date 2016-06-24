class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users_that_liked, through: :likes, source: :user

  validates_presence_of :description, :pin_image, :board_id

  has_attached_file :pin_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pin_image, content_type: /\Aimage\/.*\Z/


  def self.repost_for(pin, user)
    repost_pin = self.new
    repost_pin.board_id = user.boards.last.id
    repost_pin.user_id = user.id
    repost_pin.pin_image = pin.pin_image
    repost_pin.original_pin_id = pin.id
    repost_pin.description = pin.description
    repost_pin.save
  end

  def is_repost?
    original_pin_id.present?
  end

  def original_pin
    Pin.find(id: original_pin_id) if is_repost?
  end
end
