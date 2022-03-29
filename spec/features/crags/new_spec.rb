require 'rails_helper'
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

RSpec.describe 'the Crag creation' do
  it 'links to the new crag page from the crag index' do
    visit '/crags'

    click_link 'New Crag'
    expect(current_path).to eq('/crags/new')
  end

  it 'can create a new crag' do
    visit '/crags/new'

    fill_in('Name', with: 'Test Yosemite')
    fill_in('Year round', with: 'false')
    fill_in('Outhouses', with: '10')
    click_button('Create Crag')

    expect(current_path).to eq('/crags')
    expect(page).to have_content('Test Yosemite')
  end
end
