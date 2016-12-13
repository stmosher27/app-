# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  year       :integer          not null
#  live       :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base

  validates :band_id, :title, :year, presence: true
  validates :live, inclusion: { in: [true, false] }
  validates :title, uniqueness: { scope: :band_id }
  validates :year, numericality: { minimum: 1900, maxiumum: 9000 }

  belongs_to :band,
  foreign_key: :band_id,
  class_name: :band

  has_many :tracks, dependent: :destroy
end
