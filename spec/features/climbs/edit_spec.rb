require 'rails_helper'
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

RSpec.describe 'Climbs update' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @climb = @crag.climbs.create!(name: 'Test Fun Route', pitches: 1, trad: false)
  end

  it 'links to the update crag page from the crag show' do
    visit "/climbs/#{@climb.id}"

    click_button 'Update Climb'
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
