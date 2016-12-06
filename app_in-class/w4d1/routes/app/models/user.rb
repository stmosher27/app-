# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true

  has_many :contacts, dependent: :destroy
  has_many :contact_shares, dependent: :destroy

  has_many :shared_contacts, 
  through: :contact_shares,
  source: :contact
end
