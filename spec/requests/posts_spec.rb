require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'works! (now write some real specs)' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
      expect(response).to render_template('posts/index')
      expect(response.body).to include('Posts from user 1')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'works! (now write some real specs)' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
      expect(response).to render_template('posts/show')
      expect(response.body).to include('Post 1 from User 1')
    end
  end
end
