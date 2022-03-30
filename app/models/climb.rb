class Climb < ApplicationRecord
  belongs_to :crag

  def self.trad_true?
    where(trad: true)
  end

  def self.sort_alphabetically
    order(:name)
  end

  def self.sort_by_pitches(num_pitches)
    where(("pitches > #{num_pitches}"))
  end
end
