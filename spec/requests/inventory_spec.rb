require 'rails_helper'

RSpec.describe InventoriesController, type: :request do
  include Devise::Test::IntegrationHelpers
  describe 'POST #create' do
    context 'when the user is logged in' do
      let(:user) { create(:user) }
      let(:valid_params) { { inventory: { name: 'My Inventory' } } }

      before do
        sign_in user
      end
      context 'with invalid params' do
        let(:invalid_params) { { inventory: { name: '' } } }

        it 'does not create a new inventory' do
          expect do
            post inventories_path, params: invalid_params
          end.not_to change(Inventory, :count)
        end
      end
    end

    context 'when the user is not logged in' do
      let(:params) { { inventory: { name: 'My Inventory' } } }

      it 'redirects to the login page' do
        post inventories_path, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
