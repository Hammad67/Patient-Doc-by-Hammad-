require 'rails_helper'

RSpec.describe Visit, type: :model do
  context "Prescription validation tests" do
    it "Should save succefully [appointment must exist for visit]" do
      appointment = Appointment.new(date: DateTime.now)
      visit = Visit.new(appointment: appointment)
    end
  end
end
