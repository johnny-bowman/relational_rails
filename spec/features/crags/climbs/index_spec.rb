require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @good_route = @crag.climbs.create!(name: 'Test Good Route', pitches: 1, trad: false)
    @big_route = @crag.climbs.create!(name: 'Test Too Big to Flail', pitches: 3, trad: true)
  end

  it 'shows all songs for given Artist' do
    visit "/crags/#{@crag.id}/climbs"

    expect(page).to have_content(@good_route.name)
    expect(page).to have_content(@big_route.name)
  end


  it 'has a link to all the climbs in db' do
    visit "/crags/#{@crag.id}/climbs"
    click_link 'All Climbs'
    expect(current_path).to eq('/climbs')

    expect(page).to have_content('Test Good Route')
    expect(page).to have_content('Test Too Big to Flail')
    expect(page).to_not have_content('Test Smith Rock')
  end

  it 'has a link to all crags in the db' do
    visit "/crags/#{@crag.id}/climbs"
    click_link 'Crags'
    expect(current_path).to eq('/crags')

    expect(page).to have_content('Test Smith Rock')
    expect(page).to_not have_content('Test Good Route')
  end
end
