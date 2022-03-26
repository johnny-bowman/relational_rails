require 'rails_helper'

RSpec.describe 'the climbs show page' do
  it 'shows all the climbs' do
    smith_rock = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    fun_route = smith_rock.climbs.create!(name: 'Test Fun Route', pitches: 1, trad: false)
    long_route = smith_rock.climbs.create!(name: 'Test Long Route', pitches: 7, trad: true)
    visit "/climbs"
    save_and_open_page

    expect(page).to have_content(fun_route.name)
    expect(page).to have_content(long_route.name)
    expect(page).to have_content(fun_route.pitches)
    expect(page).to have_content(long_route.pitches)
    expect(page).to have_content(fun_route.trad)
    expect(page).to have_content(long_route.trad)
  end
end
