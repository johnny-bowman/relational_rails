require 'rails_helper'

RSpec.describe 'Crag climbs new' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @good_route = @crag.climbs.create!(name: 'Test Good Route', pitches: 1, trad: false)
  end

  it 'links to the create child page' do
    visit "/crags/#{@crag.id}/climbs"

    expect(page).to have_content('Test Good Route')
    expect(page).to_not have_content('New Test Route')

    click_link "Create Climb"

    expect(current_path).to eq("/crags/#{@crag.id}/climbs/new")
  end

  it 'creates a new climb for specific crag' do
    visit "/crags/#{@crag.id}/climbs"

    expect(page).to have_content('Test Good Route')
    expect(page).to_not have_content('New Test Route')

    visit "/crags/#{@crag.id}/climbs/new"

    fill_in('Name', with: 'New Test Route')
    fill_in('Pitches', with: '5')
    fill_in('Trad', with: 'true')
    click_button('Create Climb')

    expect(current_path).to eq("/crags/#{@crag.id}/climbs")
    expect(page).to have_content('New Test Route')
    expect(page).to have_content('Test Good Route')
  end
end
