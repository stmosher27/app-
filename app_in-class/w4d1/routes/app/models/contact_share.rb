# == Schema Information
#
# Table name: contact_shares
#
#  id :integer          not null, primary key
#

class ContactShare < ActiveRecord::Base
  validates :contact, :user, :presence => true
  validates :contact_id, uniqueness: { scope: :user_id }

  belongs_to :contact
  belongs_to :user


end
