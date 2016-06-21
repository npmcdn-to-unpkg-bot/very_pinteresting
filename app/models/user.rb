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
end
