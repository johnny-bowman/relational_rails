require 'rails_helper'

RSpec.describe 'Crags update' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
  end

  it 'links to the update crag page from the crag show' do
    visit "/crags/#{@crag.id}"
    # save_and_open_page

    click_link 'Update Crag'
    expect(current_path).to eq("/crags/#{@crag.id}/edit")
  end

  it "links to the update crag page from the crag index" do
    visit "/crags"

    click_link 'Update Crag'
    expect(current_path).to eq("/crags/#{@crag.id}/edit")
  end

  it 'can edit Crag' do
    visit "/crags/#{@crag.id}"
    expect(page).to have_content("Test Smith Rock")

    click_link 'Update Crag'

    fill_in "Name", with: "Updated Smith Rock"
    fill_in "Year round?", with: "true"
    fill_in "Outhouses", with: "4"
    click_button "Update Crag"

    expect(current_path).to eq("/crags/#{@crag.id}")
    expect(page).to have_content("Updated Smith Rock")
  end
end
