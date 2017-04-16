require 'spec_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'update' do
    let(:owner) { FactoryGirl.create(:user) }
    let(:cheater) { FactoryGirl.create(:user) }
    let!(:category) { FactoryGirl.create(:category, user: owner) }

    it 'another user cannot edit other users categories' do
      sign_in cheater

      expect {
        put :update,
          id: category.id,
          category: FactoryGirl.attributes_for(:category, name: 'new name')
      }.to raise_exception(ActiveRecord::RecordNotFound)

      expect(category.name).to eq('clothes')
    end

    it 'owner can edit his categories' do
      sign_in owner

      expect {
        put :update,
          id: category.id,
          category: FactoryGirl.attributes_for(:category, name: 'new name')
      }.to change { category.reload.name }.to('new name')
    end
  end
end
