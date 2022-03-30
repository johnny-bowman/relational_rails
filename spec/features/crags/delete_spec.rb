require 'rails_helper'

RSpec.describe 'Crags delete' do
  before :each do
    @smith_rock = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    @j_tree = Crag.create!(name: 'Test Joshua Tree', year_round: false, outhouses: 5)
    @fun_route = @smith_rock.climbs.create!(name: 'Test Fun Route', pitches: 1, trad: false)
    @long_route = @smith_rock.climbs.create!(name: 'Test Long Route', pitches: 7, trad: true)
  end

  it 'delete crags' do
    visit "/crags"
    expect(page).to have_content(@smith_rock.name)
    expect(page).to have_content(@j_tree.name)

    visit "/crags/#{@smith_rock.id}"
    click_link "Delete Crag"

    expect(current_path).to eq("/crags")
    expect(page).to_not have_content(@smith_rock.name)
    expect(page).to have_content(@j_tree.name)
  end
end
