require 'rails_helper'

RSpec.describe 'the climbs show page' do
  before :each do
    @crag = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @fun_route = @crag.climbs.create!(name: 'Test Fun Route', pitches: 1, trad: false)
    @long_route = @crag.climbs.create!(name: 'Test Long Route', pitches: 7, trad: true)
  end

  it 'shows climb with given id' do
    visit "/climbs/#{@fun_route.id}"

    expect(page).to have_content(@fun_route.name)
    expect(page).to have_content(@fun_route.pitches)
    expect(page).to have_content(@fun_route.trad)
    expect(page).to_not have_content(@long_route.name)
  end

  it 'has a link to all crags in the db' do
    visit "/climbs/#{@fun_route.id}"
    click_link 'Crags'
    expect(current_path).to eq('/crags')

    expect(page).to have_content('Test Smith Rock')
  end

  it 'has a link to all the climbs in db' do
    visit "/climbs/#{@fun_route.id}"
    click_link 'All Climbs'
    expect(current_path).to eq('/climbs')

    expect(page).to have_content('Test Long Route')
  end
end
