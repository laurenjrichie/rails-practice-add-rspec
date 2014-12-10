require 'rails_helper'

feature 'Events' do
  scenario 'User edits an event' do
    Event.create!(
      description: "SantaCon"
    )

    visit root_path
    click_on "edit"
    fill_in "Location", with: "Blah"
    click_on "Update Event"

    expect(page).to have_content("Blah")
  end

  scenario 'listing events' do
    Event.create!(
      description: "free lunch today",
    )

    Event.create!(
      description: "Hug Momo Hour",
    )

    Event.create!(
      description: "Ramen festival",
    )

    visit root_path

    expect(page).to have_content("free lunch today")
    expect(page).to have_content("Hug Momo Hour")
    expect(page).to have_content("Ramen festival")

  end

  scenario 'deleting events' do
    Event.create!(
      description: "Im going to be deleted"
    )

    visit root_path
    click_on "delete"

    expect(page).to have_no_content("Im going to be deleted")
    expect(page.current_path).to eq(events_path)
  end

  scenario 'creating events' do

    visit root_path
    click_on "New Event"
    fill_in("Description", :with => "Twerk Time")
    click_on("Create Event")

    expect(page).to have_content("Twerk Time")
  end

  scenario 'showing a single event' do
    Event.create!(
      description: "Show me"
    )

    Event.create!(
      description: "Dont show me"
    )

    visit root_path
    click_on("Show me")

    expect(page).to have_content("Show me")
    expect(page).to_not have_content("Dont show me")

  end
end
