require "rails_helper"

RSpec.describe "Climbs Delete" do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @fun_route = @crag.climbs.create!(name: 'Test Fun Route', pitches: 1, trad: true)
    @long_route = @crag.climbs.create!(name: 'Test Long Route', pitches: 7, trad: true)
  end

  it "deletes climbs" do
    visit "/climbs"
    expect(page).to have_content('Test Fun Route')
    expect(page).to have_content('Test Long Route')

    visit "/climbs/#{@fun_route.id}"
    click_link "Delete Climb"
  
    expect(current_path).to eq("/climbs")
    expect(page).to_not have_content('Test Fun Route')
    expect(page).to have_content('Test Long Route')
  end
end
