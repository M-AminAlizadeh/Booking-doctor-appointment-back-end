class ReservationSerializer
  include JSONAPI::Serializer
  attributes :id, :doctor_id, :user_id, :date_of_appointment
end
