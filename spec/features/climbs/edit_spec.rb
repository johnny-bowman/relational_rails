require 'rails_helper'

RSpec.describe 'Climbs edit' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @climb = @crag.climbs.create!(name: 'Test Fun Route', pitches: 1, trad: true)
  end

  it 'links to the update climb page from the crag show' do
    visit "/climbs/#{@climb.id}"

    click_button 'Update Climb'
    expect(current_path).to eq("/climbs/#{@climb.id}/edit")
  end

  it 'links to the update climb page from the crag index' do
    visit "/climbs"

    click_link 'Update Climb'
    expect(current_path).to eq("/climbs/#{@climb.id}/edit")
  end

  it 'links to the update climb page from the crag_climbs index' do
    visit "/crags/#{@crag.id}/climbs"

    click_link 'Update Climb'
    expect(current_path).to eq("/climbs/#{@climb.id}/edit")
  end

  it 'updates a Climb' do
    visit "/climbs/#{@climb.id}"

    expect(page).to have_content("Test Fun Route")
    expect(page).to_not have_content("Updated Fun Route")

    visit "/climbs/#{@climb.id}/edit"
    fill_in "Name", with: "Updated Fun Route"
    fill_in "Trad", with: "true"
    fill_in "Pitches", with: "7"
    click_button "Update Climb"

    expect(current_path).to eq("/climbs/#{@climb.id}")
    expect(page).to have_content("Updated Fun Route")
    expect(page).to_not have_content("Test Fun Route")

  end
end
