class Climb < ApplicationRecord
  belongs_to :crag

  def self.trad_true?
    where(trad: true)
  end

  def self.sort_alphabetically
    order(:name)
  end
end
