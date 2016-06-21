class Like < ActiveRecord::Base
  belongs_to :pin
  belongs_to :user
  
  validates_uniqueness_of :pin_id, scope: :user_id
end
