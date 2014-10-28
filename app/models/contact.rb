class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates_uniqueness_of :user_id, :scope => :email
  
  has_many(
    :contact_shares,
    class_name: "ContactShare",
    foreign_key: :contact_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :users,
    through: :contact_shares,
    source: :user
  )
end