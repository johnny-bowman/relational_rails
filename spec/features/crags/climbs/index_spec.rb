require 'rails_helper'
# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
RSpec.describe 'Crag climbs index' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @good_route = @crag.climbs.create!(name: 'Test Good Route', pitches: 1, trad: false)
    @big_route = @crag.climbs.create!(name: 'Test Too Big to Flail', pitches: 3, trad: true)
  end

  it 'shows all climbs for given Crag' do
    visit "/crags/#{@crag.id}/climbs"

    expect(page).to have_content(@good_route.name)
    expect(page).to have_content(@big_route.name)
  end


  it 'has a link to all the climbs in db' do
    visit "/crags/#{@crag.id}/climbs"
    click_link 'All Climbs'
    expect(current_path).to eq('/climbs')

    expect(page).to have_content('Test Too Big to Flail')
    expect(page).to_not have_content('Test Smith Rock')
  end

  it 'has a link to all crags in the db' do
    visit "/crags/#{@crag.id}/climbs"
    click_link 'Crags'
    expect(current_path).to eq('/crags')

    expect(page).to have_content('Test Smith Rock')
    expect(page).to_not have_content('Test Good Route')
  end

  it 'can sort climbs alphabetically' do
    @sick_route = @crag.climbs.create!(name: 'American Flarelines', pitches: 2, trad: true)

    visit "/crags/#{@crag.id}/climbs"

    click_link "Sort Climbs Alphabetically"

    expect(current_path).to eq("/crags/#{@crag.id}/climbs")
    expect('American Flarelines').to appear_before('Test Good Route')
    expect('Test Good Route').to appear_before('Test Too Big to Flail')
  end

  it "limits results to records over given number of pitches" do
    @fun_route = @crag.climbs.create!(name: 'Test Fun Route', pitches: 4, trad: true)

    visit "/crags/#{@crag.id}/climbs"
    # save_and_open_page
    expect(page).to have_content('Test Fun Route')
    expect(page).to have_content('Test Too Big to Flail')
    expect(page).to have_content('Test Good Route')
    # save_and_open_page
    fill_in "Number of pitches", with: "2"
    click_button "Only return records with more than 'number' of pitches"
    # save_and_open_page
    expect(current_path).to eq("/crags/#{@crag.id}/climbs")

    expect(page).to have_content('Test Fun Route')
    expect(page).to have_content('Test Too Big to Flail')
    expect(page).to_not have_content('Test Good Route')
  end
end
