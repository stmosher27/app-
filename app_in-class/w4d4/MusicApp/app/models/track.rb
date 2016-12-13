# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  bonus      :boolean          default("false"), not null
#  album_id   :integer
#  ord        :integer          not null
#  lyrics     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  belongs_to :album

  has_one :band,
  through: :album,
  source: :band

  has_many :notes, dependent: :destroy

  validates :album, :lyrics, :name, :ord, presence: true

  validates :bonus, inclusion: { in: [true, false]}
  validates :ord, uniqueness: { scope: :album_id }
end
