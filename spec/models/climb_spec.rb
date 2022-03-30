require 'rails_helper'

RSpec.describe Climb, type: :model do
  it {should belong_to :crag}

  it 'sorts climbs alphabetically' do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @sick_route = @crag.climbs.create!(name: 'American Flarelines', pitches: 2, trad: true)
    @big_route = @crag.climbs.create!(name: 'Test Too Big to Flail', pitches: 3, trad: true)
    @good_route = @crag.climbs.create!(name: 'Test Good Route', pitches: 1, trad: false)

    expect(@crag.climbs.sort_alphabetically).to eq([@sick_route, @good_route, @big_route])
  end

  it 'identifies if trad? value is true' do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @sick_route = @crag.climbs.create!(name: 'American Flarelines', pitches: 2, trad: true)
    @good_route = @crag.climbs.create!(name: 'Test Good Route', pitches: 1, trad: false)

    expect(Climb.trad_true?).to eq([@sick_route])
  end

  it 'shows only climbs with more than x pitches' do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @sick_route = @crag.climbs.create!(name: 'American Flarelines', pitches: 2, trad: true)
    @big_route = @crag.climbs.create!(name: 'Test Too Big to Flail', pitches: 3, trad: true)
    @good_route = @crag.climbs.create!(name: 'Test Good Route', pitches: 1, trad: false)
    
    expect(Climb.sort_by_pitches(1)).to eq([@sick_route, @big_route])
  end
end
