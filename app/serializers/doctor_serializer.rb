class DoctorSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :hospital, :specialization, :cost_per_consult, :description, :image, :image_url, :created_at, :updated_at
end
