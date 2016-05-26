class Pin < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :description
  has_attached_file :pin_image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :pin_image, content_type: /\Aimage\/.*\Z/
  # attr_accessor :pin_image_file_name
end
