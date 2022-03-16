require "rails_helper"
RSpec.describe AppointmentsController, :type => :controller do
  patient = Patient.create!(first_name: "Fg", last_name: "anytgghing", email: "dgjhbFFbhf@gmail.com", phone_number: "+144476780012")
  doctor = Doctor.create!(first_name: "Hmad", last_name: "anyting", email: "ddFVVDff@gmail.com", password: "sfsdfxvsdfcd", phone_number: "+156567033123")
  appointment = Appointment.create(date: DateTime.now, patient: patient, doctor: doctor)
  describe "GET show" do
    it "has a 200 status code" do
      get :show, params: { patient_id: patient.id, id: appointment.id }
      expect(response.status).to eq(200)
    end
  end
  describe "GET edit" do
    it "Edit template and action is working" do
      get :edit, params: { patient_id: patient.id, id: appointment.id }
      expect(response.status).to eq(200)
    end
  end
  describe "PATCH UPDATE" do
    it "Updates appointment and redirects" do
      patch :update, params: { patient_id: patient.id, id: appointment.id, appointment: { date: DateTime.now, patient: patient, doctor: doctor } }
      expect(response).to be_redirect
    end
    it "Invalid data for updating appointment" do
      patch :update, params: { patient_id: patient.id, id: appointment.id, appointment: { date: "", patient: "", doctor: "ghghf" } }
      expect(response).to_not be_redirect
    end
  end
  describe "DELETE APPOINTMENT" do
    it "DELETES appointment and redirects" do
      delete :destroy, params: { patient_id: patient.id, id: appointment.id }
      expect(response).to be_redirect
    end
  end
end