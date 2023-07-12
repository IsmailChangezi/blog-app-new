require 'rails_helper'

describe 'Users Post Index', type: :feature do
  before :each do
    @user = User.create(name: 'Muhammed-ali', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist')
    @user2 = User.create(name: 'Bonzai73', photo: 'https://bon-bon.jpg', bio: 'Monk of the mountains')
    @post1 = Post.create(author_id: @user.id, title: 'The way of the Water',
                         text: 'In martial arts, the way of the water is the way of the soft and yielding')
    @post2 = Post.create(author_id: @user.id, title: 'Amaterasu',
                         text: 'Amaterasu is the goddess of the sun and the universe, the ultimate source of all life')
    @post3 = Post.create(author_id: @user.id, title: 'Legacy', text: 'The legacy of the righteous is a blessing')
    Comment.create(user_id: @user2.id, post_id: @post1.id, text: 'I like this post')
    Comment.create(user_id: @user.id, post_id: @post1.id, text: 'Thanks! I wrote it myself based on my experiences')
    Like.create(user_id: @user2.id, post_id: @post1.id)
    Like.create(user_id: @user.id, post_id: @post1.id)
    visit user_posts_path(@user.id)
  end

  scenario "I can see the user's profile picture" do
    expect(page).to have_css("img[src*='https://Akaiiii.jpg']")
  end

  scenario "I can see the user's username" do
    expect(page).to have_content('Muhammed-ali')
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 3')
  end

  scenario "I can see a post's title" do
    expect(page).to have_content('The way of the Water')
  end

  scenario "I can see some of the post's body" do
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding')
  end

  scenario 'I can see the first comments on a post' do
    expect(page).to have_content('I like this post')
  end

  scenario 'I can see how many comments a post has' do
    expect(page).to have_content('Comments: 2')
  end

  scenario 'I can see how many likes a post has' do
    expect(page).to have_content('Likes: 2')
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_content('Pagination')
  end

  scenario "When I click on a post, it redirects me to that post's show page" do
    click_on('The way of the Water')
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding')
  end
end
