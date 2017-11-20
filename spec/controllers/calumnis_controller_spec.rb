require 'rails_helper'

RSpec.describe CalumnisController, type: :controller do
  describe "GET index" do
    it "assigns @teams" do
      people = People.create
      get :upload
      expect(assigns(:teams)).to eq([team])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
