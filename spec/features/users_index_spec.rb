require 'rails_helper'

RSpec.describe 'Users Index', type: :feature do
  before :each do
    author1 = User.create(name: 'Abebe', photo: 'https://Abebe.jpg', bio: 'Abebe bio')
    author2 = User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist')
    Post.create(title: 'Legese Title', text: 'The Legese Title of the righteous is a blessing and blessing',
                author_id: author1.id)
    Post.create(title: 'The way of the Water',
                text: 'In martial arts, the way of the water is the way of the soft and yielding',
                author_id: author2.id)
    Post.create(title: 'Amaterasu',
                text: 'Amaterasu is the goddess of the sun and the universe, the ultimate source of all life',
                author_id: author2.id)
  end

  scenario 'I can see the username of all other users' do
    visit '/users'
    expect(page).to have_content('Abebe')
    expect(page).to have_content('Akai321')
  end

  scenario 'I can see the profile picture for each user' do
    visit '/users'
    expect(page).to have_css("img[src*='https://Abebe.jpg']")
    expect(page).to have_css("img[src*='https://Akaiiii.jpg']")
  end

  scenario 'I can see the number of posts each user has written' do
    visit '/users'
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Number of posts: 2')
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    visit '/users'
    click_link 'Abebe'
    expect(page).to have_content('Abebe')
    expect(page).to have_content('Abebe bio')
    expect(page).to have_content('Legese Title')
  end
end