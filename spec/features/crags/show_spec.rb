require 'rails_helper'

RSpec.describe 'the crags show page' do
  before :each do
    @smith_rock = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @j_tree = Crag.create!(name: 'Test Joshua Tree', year_round: false, outhouses: 5)
    @fun_route = @smith_rock.climbs.create!(name: 'Test Fun Route', pitches: 1, trad: false)
    @long_route = @smith_rock.climbs.create!(name: 'Test Long Route', pitches: 7, trad: true)
  end

  it 'displays the crag name given its id' do
    visit "/crags/#{@smith_rock.id}"

    expect(page).to have_content(@smith_rock.name)
    expect(page).to_not have_content(@j_tree.name)
  end

  it 'displays the number of climbs at a crag' do
    @smith_rock.climbs.create!(name: 'Test Fun Route', pitches: 2, trad: true)
    visit "/crags/#{@smith_rock.id}"

    expect(page).to have_content("Climbs:\n3")
  end

  it 'has a link to all the climbs in db' do
    visit "/crags/#{@smith_rock.id}"
    click_link 'All Climbs'
    expect(current_path).to eq('/climbs')

    expect(page).to have_content('Test Long Route')
    expect(page).to_not have_content('Test Smith Rock')
  end

  it 'has a link to all crags in the db' do
    visit "/crags/#{@smith_rock.id}"
    click_link 'Crags'
    expect(current_path).to eq('/crags')

    expect(page).to have_content('Test Smith Rock')
    expect(page).to have_content('Test Joshua Tree')
    expect(page).to_not have_content('Test Fun Route')
  end

  it 'has a link to all climbs at Crag on this page' do
    visit "/crags/#{@smith_rock.id}"
    click_link 'Climbs at This Crag'
    expect(current_path).to eq("/crags/#{@smith_rock.id}/climbs")

    expect(page).to have_content('Test Fun Route')
    expect(page).to have_content('Test Long Route')
    expect(page).to_not have_content('Test Smith Rock')
    expect(page).to_not have_content('Test Joshua Tree')
  end
end
