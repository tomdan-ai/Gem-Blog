require 'swagger_helper'

RSpec.describe 'Create Comment API', type: :request, swagger_doc: 'v1/swagger.json' do
  path '/api/v1/posts/{post_id}/comments' do
    parameter name: 'post_id', in: :path, type: :integer, required: true

    post 'Creates a comment for a post' do
      tags 'Create Comment'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '201', 'comment created' do
        let(:user) { create(:user) }
        let(:post) { create(:post) }
        let(:user_id) { user.id }
        let(:post_id) { post.id }
        let(:comment) { { text: 'A new comment' } }
        run_test!
      end
    end
  end
end
