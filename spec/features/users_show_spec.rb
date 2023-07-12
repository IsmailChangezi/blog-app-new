require 'rails_helper'

describe 'Users Show', type: :feature do
  let :user do
    User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist')
  end

  let! :post1 do
    Post.create(author_id: user.id, title: 'The way of the Water',
                text: 'In martial arts, the way of the water is the way of the soft and yielding')
  end

  let! :post2 do
    Post.create(author_id: user.id, title: 'Amaterasu',
                text: 'Amaterasu is the goddess of the sun and the universe, the ultimate source of all life')
  end

  let! :post3 do
    Post.create(author_id: user.id, title: 'Legacy', text: 'The legacy of the righteous is a blessing')
  end

  before { visit user_path(user) }

  scenario "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://Akaiiii.jpg']")
  end

  scenario "I can see the user's username" do
    expect(page).to have_content('Akai321')
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 3')
  end

  scenario "I can see the user's bio" do
    expect(page).to have_content('Martial Artist')
  end

  scenario "I can see the user's first 3 posts" do
    expect(page).to have_content('The way of the Water')
    expect(page).to have_content('Amaterasu')
    expect(page).to have_content('Legacy')
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    expect(page).to have_link('See all posts')
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    click_link 'The way of the Water'
    expect(page).to have_content('The way of the Water')
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding')
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    click_link 'See all posts'
    expect(page).to have_content('The way of the Water')
    expect(page).to have_content('Amaterasu')
    expect(page).to have_content('Legacy')
  end
end
