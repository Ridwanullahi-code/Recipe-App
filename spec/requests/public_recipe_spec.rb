require 'rails_helper'

RSpec.describe PublicRecipesController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user, confirmed_at: Time.current) }
    let!(:recipe1) { create(:recipe, name: 'Recipe 1', public: true, created_at: 1.day.ago, user: user) }
    let!(:recipe2) { create(:recipe, name: 'Recipe 2', public: true, created_at: 2.days.ago, user: user) }
    let!(:recipe3) { create(:recipe, name: 'Recipe 3', public: true, created_at: 3.days.ago, user: user) }

    before do
      ActionMailer::Base.deliveries.clear
      sign_in user
      get :index
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns public recipes to @recipes in descending order' do
      expect(assigns(:recipes)).to eq([recipe1, recipe2, recipe3])
    end
  end
end
