require 'rails_helper'

RSpec.describe Crag, type: :model do
  it {should have_many :climbs}
end
