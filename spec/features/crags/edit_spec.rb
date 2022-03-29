require 'rails_helper'
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

RSpec.describe 'Crags update' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
  end

  it 'links to the update crag page from the crag show' do
    visit "/crags/#{@crag.id}"
    # save_and_open_page

    click_button 'Update Crag'
    expect(current_path).to eq("/crags/#{@crag.id}/edit")
  end

  it 'can edit Crag' do
    visit "/crags/#{@crag.id}"
    expect(page).to have_content("Test Smith Rock")

    click_button 'Update Crag'

    fill_in "Name", with: "Updated Smith Rock"
    fill_in "Year round?", with: "true"
    fill_in "Outhouses", with: "4"
    click_button "Update Crag"

    expect(current_path).to eq("/crags/#{@crag.id}")
    expect(page).to have_content("Updated Smith Rock")
  end
end
