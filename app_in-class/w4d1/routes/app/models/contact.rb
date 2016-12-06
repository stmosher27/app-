# == Schema Information
#
# Table name: contacts
#
#  id      :integer          not null, primary key
#  name    :string           not null
#  email   :string           not null
#  user_id :integer          not null
#

class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, :presence => true
  validates :email, uniqueness: { scope: :user_id }

  belongs_to :owner,
  foreign_key: :user_id,
  class_name: :User

  has_many :contact_shares

  has_many :shared_users,
  through: :contact_shares,
  source: :user

end
