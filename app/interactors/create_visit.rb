class CreateVisit
  include Interactor

  def call
    visit = Visit.new()
    visit.appointment_id = context.appointment
    context.visit = visit
    context.fail! unless visit.save
  end
end