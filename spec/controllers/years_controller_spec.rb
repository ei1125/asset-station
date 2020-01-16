require 'rails_helper'

describe YearsController do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe 'GET #show' do
    it "assigns the requested tweet to @tweet" do
      year = create(:year)
      get :show, params: { id: year }
      expect(assigns(:year)).to eq year
    end

    it "renders the :show template" do
      year = create(:year)
      get :show, params: { id: year }
      expect(response).to render_template :show
    end
  end

end

# bundle exec rspec spec/controllers/years_controller_spec.rb