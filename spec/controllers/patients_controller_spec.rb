require "rails_helper"

RSpec.describe PatientsController, :type => :controller do
  patient = Patient.create(first_name: "Fg", last_name: "anytgghing", email: "dsdggasf@gmail.com", phone_number: "+412403556776")
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end
  describe "GET show" do
    it "Show action is executing successfully with template" do
      get :show, params: { id: patient.id }
      expect(response.status).to eq(200)
    end
  end
  describe "GET Edit" do
    it "Update action is executing successfully with template" do
      get :edit, params: { id: patient.id }
      expect(response.status).to eq(200)
    end
  end
  describe "PATCH update" do
    it "Updates the patient and redirects" do
      patch :update, params: { id: patient.id, patient: { first_name: "hhg", last_name: "anytgghing", email: "dsdvfbhhfhdhb@gmail.com", phone_number: "+012403556776" } }
      expect(response).to be_redirect
    end
  end
  it "does not change the patient, and re-renders the form" do
    patch :update, params: { id: patient.id, patient: { first_name: "", last_name: "anytgghing", email: "dfhgfghg@gmail.com", phone_number: "+612473556776" } }
    expect(response).not_to be_redirect
  end
end