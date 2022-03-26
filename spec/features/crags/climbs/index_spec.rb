require 'rails_helper'

RSpec.describe 'Artists songs index' do
  it 'shows all songs for given Artist' do
    crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    good_route = crag.climbs.create!(name: 'Test Good Route', pitches: 1, trad: false)
    big_route = crag.climbs.create!(name: 'Test Too Big to Flail', pitches: 3, trad: true)
    visit "/crags/#{crag.id}/climbs"
    save_and_open_page

    expect(page).to have_content(good_route.name)
    expect(page).to have_content(big_route.name)
  end
end
