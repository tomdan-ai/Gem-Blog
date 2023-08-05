require 'swagger_helper'

RSpec.describe 'Post Comments API', type: :request, swagger_doc: 'v1/swagger.json' do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :integer, required: true
    parameter name: 'post_id', in: :path, type: :integer, required: true

    get 'Retrieves comments of a post' do
      tags 'Post Comments'
      produces 'application/json'

      response '200', 'comments found' do
        schema type: :array,
          items: { '$ref' => '#/components/schemas/Comment' }
        let(:user) { create(:user) }
        let(:post) { create(:post, user: user) }
        let(:user_id) { user.id }
        let(:post_id) { post.id }
        run_test!
      end
    end
  end
end
