# require 'rails_helper'
#
# RSpec.describe Doctor, type: :model do
#
#   context "validation tests" do
#     it "Should save succefully" do
doctor = Doctor.new(first_name: "Hmad", last_name: "anyting", email: "d@gmail.com", password: "ahgvchv", phone_number: "+903486556776")
#       patient = Patient.new(first_name: "ibra", last_name: "anything", email: "dc@gmail.com", phone_number: "+903486556776")
#       expect(doctor).to be_valid
#     end
#     it "Should not save succefully" do
#       doctor = Doctor.new(first_name: "Hammad", last_name: "anything", email: "", password: "", phone_number: "+923486556776")
#       expect(doctor).to_not be_valid
#     end
#   end
# end
