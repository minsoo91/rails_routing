class User < ActiveRecord::Base
  validates :username, presence: true
  
  has_many(
    :contact_shares,
    class_name: "ContactShare",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :contacts,
    through: :contact_shares,
    source: :contact
  )
end