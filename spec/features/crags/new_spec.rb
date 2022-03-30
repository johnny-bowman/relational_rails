require 'rails_helper'

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
