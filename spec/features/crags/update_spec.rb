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

RSpec.describe 'the Crag creation' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
  end

  it 'links to the update crag page from the crag show' do
    visit "/crags/#{@crag.id}"

    click_link 'Update Crag'
    expect(current_path).to eq("/crags/#{@crag.id}/edit")
  end
end
