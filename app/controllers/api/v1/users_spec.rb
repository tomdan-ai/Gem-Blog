require 'swagger_helper'

RSpec.describe 'User Posts API', type: :request, swagger_doc: 'v1/swagger.json' do
  path '/api/v1/users/{user_id}/posts' do
    parameter name: 'user_id', in: :path, type: :integer, required: true

    get 'Retrieves posts of a user' do
      tags 'User Posts'
      produces 'application/json'

      response '200', 'posts found' do
        schema type: :array,
          items: { '$ref' => '#/components/schemas/Post' }
        let(:user) { create(:user) }
        let(:user_id) { user.id }
        run_test!
      end
    end
  end
end
