class CreateVisit
  include Interactor

  def call
    visit=Visit.new()
    visit.appointment_id=context.appointment
    if visit.save
      context.visit=visit
    else
      context.visit=visit
      context.fail!
    end

  end
end