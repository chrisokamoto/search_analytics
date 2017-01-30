require 'rails_helper'

RSpec.describe SearchAnalyticsController, type: :controller do
  let!(:search_analytic_quantity_1) { create(:search_analytic) }
  let!(:search_analytic_quantity_2) { create(:search_analytic_quantity_2) }

  describe "GET #show_search_analytics" do
    it "order analytics by frequency desc" do
      expect(subject.show_search_analytics).to eq([search_analytic_quantity_2, search_analytic_quantity_1])
    end
  end

  describe "POST #save_search" do
    it "increase the quantity (frequency) of a search by one if it already exists on the database" do
      post :save_search, article_title: 'How do I cancel my subscription?', format: :json
      expect(assigns(:search_analytic)).to be_persisted
      expect(assigns(:search_analytic).quantity).to eq(2)
    end

    it "initialize the quantity (frequency) with 1 if it doesn't exist on the database yet" do
      post :save_search, article_title: 'How many people exist in the world?', format: :json
      expect(assigns(:search_analytic)).to be_persisted
      expect(assigns(:search_analytic).quantity).to eq(1)
    end
  end

  describe "DELETE #destroy" do
    it "given any id, deletes all the SearchAnalytic's of the database" do
      delete :destroy, id:0
      expect(SearchAnalytic.all.count).to eq(0)
    end
  end
end
