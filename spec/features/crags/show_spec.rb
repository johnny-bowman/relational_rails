require 'rails_helper'

RSpec.describe 'the crags show page' do
  before :each do
    @smith_rock = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @j_tree = Crag.create!(name: 'Test Joshua Tree', year_round: false, outhouses: 5)
  end

  it 'display all names of crags in db' do
    visit "/crags"

    expect(page).to have_content(@smith_rock.name)
    expect(page).to have_content(@j_tree.name)
  end

  it 'displays the crag name given its id' do
    visit "/crags/#{@smith_rock.id}"

    expect(page).to have_content(@smith_rock.name)
    expect(page).to_not have_content(@j_tree.name)
  end

  it 'displays the number of climbs at a crag' do
    @smith_rock.climbs.create!(name: 'Test Fun Route', pitches: 2, trad: true)
    visit "/crags/#{@smith_rock.id}"

    expect(page).to have_content("Climbs:\n1")
  end
end
