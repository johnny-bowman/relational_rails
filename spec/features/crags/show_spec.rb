require 'rails_helper'

RSpec.describe 'the crags show page' do
  it 'display all names of crags in db' do
    smith_rock = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    j_tree = Crag.create!(name: 'Test Joshua Tree', year_round: false, outhouses: 5)
    visit "/crags"

    expect(page).to have_content(smith_rock.name)
    expect(page).to have_content(j_tree.name)
  end

  it 'displays the crag name given its id' do
    smith_rock = Crag.create!(name: 'Test Smith Rock', year_round: true, outhouses: 2)
    j_tree = Crag.create!(name: 'Test Joshua Tree', year_round: false, outhouses: 5)
    visit "/crags/#{smith_rock.id}"

    expect(page).to have_content(smith_rock.name)
    expect(page).to_not have_content(j_tree.name)

  end
end
