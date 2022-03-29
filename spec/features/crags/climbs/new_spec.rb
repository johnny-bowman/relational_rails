require 'rails_helper'
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe 'Crags update' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @good_route = @crag.climbs.create!(name: 'Test Good Route', pitches: 1, trad: false)
  end

  it 'links to the create child page' do
    visit "/crags/#{@crag.id}/climbs"

    expect(page).to have_content('Test Good Route')
    expect(page).to_not have_content('New Test Route')

    click_button "Create Climb"

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
    click_button('Create Crag')

    expect(current_path).to eq("/crags/#{@crag.id}/climbs")
    expect(page).to have_content('New Test Route')
    expect(page).to have_content('Test Good Route')
  end
end
