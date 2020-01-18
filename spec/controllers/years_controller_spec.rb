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

  # describe 'GET #index' do
  
  #   context 'log in' do
  #     before do
  #       login user
  #     end

      # it "populates an array of years ordered by year DESC" do
      #   years = create_list(:year, 3)
      #   get :index
      #   expect(assigns(:years)).to match(years.year.sort.reverse)
      # end
  
      # it "renders the :index template" do
      #   get :index
      #   expect(response).to render_template :index
      # end
  #   end
  # end

  

end

# bundle exec rspec spec/controllers/years_controller_spec.rb