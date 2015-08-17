class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true, uniqueness: true

  belongs_to :owner,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
end
