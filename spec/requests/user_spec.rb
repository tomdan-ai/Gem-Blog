require 'rails_helper'

describe User, type: :request do
  describe 'routes with user_controller' do
    it 'should render the index action correctly' do
      get '/user'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('user/index')
      expect(response.body).to include('All Users Page')
    end

    it 'should render the show action correctly' do
      get '/user/:id'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('user/show')
      expect(response.body).to include('Single user page')
    end
  end
end
