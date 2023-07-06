require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get users_path
      expect(response).to have_http_status(200)
      expect(response).to render_template('users/index')
      expect(response.body).to include('Users list')
    end
  end

  describe 'GET /users/1' do
    it 'works! (now write some real specs)' do
      get user_path(1)
      expect(response).to have_http_status(200)
      expect(response).to render_template('users/show')
      expect(response.body).to include('User 1')
    end
  end
end
