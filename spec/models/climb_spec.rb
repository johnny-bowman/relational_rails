require 'rails_helper'

RSpec.describe Climb, type: :model do
  it {should belong_to :crag}
end
