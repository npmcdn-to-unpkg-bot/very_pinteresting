class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_pins, through: :likes, source: :pin
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_uniqueness_of :username
  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
