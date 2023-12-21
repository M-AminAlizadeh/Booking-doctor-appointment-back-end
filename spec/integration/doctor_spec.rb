# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'v1/doctors', type: :request do
  include RequestSpecHelper

  let(:access_token) { confirm_and_login_user }
  let(:Authorization) { "Bearer #{access_token}" }

  describe 'doctorsAPI' do
    before(:all) do
      FactoryBot.create(:doctor)
      FactoryBot.create(:doctor)
    end

    path '/v1/doctors/{id}' do
      get 'Retrieves a doctor' do
        tags 'Doctors'
        produces 'application/json', 'application/xml'
        security [Bearer: {}]
        parameter name: :Authorization, in: :header, type: :string
        parameter name: :id, in: :path, type: :string

        response '200', 'name found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   hospital: { type: :string },
                   specialization: { type: :string },
                   cost_per_consult: { type: :integer },
                   description: { type: :string }
                 },
                 required: %w[id name hospital specialization cost_per_consult description]

          let(:id) do
            Doctor.create(name: 'Doctor 2', hospital: 'Skopje', specialization: 'nervs', cost_per_consult: 30, description: 'h
              eev ev ew v ewvewv').id
          end
          run_test!
        end

        response '404', 'doctor not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/v1/doctors' do
      post 'Creates a doctor' do
        tags 'Doctors'
        consumes 'application/json', 'application/xml'
        security [Bearer: {}]
        parameter name: :Authorization, in: :header, type: :string
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            specialization: { type: :string },
            hospital: { type: :string },
            cost_per_consult: { type: :integer },
            description: { type: :string },
            image_url: { type: :string }
          },
          required: %w[name specialization hospital cost_per_consult description]
        }

        response '201', 'doctor created' do
          let(:doctor) do
            { name: 'docy', hospital: 'Struga', specialization: 'urology', cost_per_consult: 24,
              description: 'description' }
          end
          schema type: :object,
                 properties: {

                   id: { type: :integer },
                   name: { type: :string },
                   hospital: { type: :string },
                   specialization: { type: :string },
                   costPerDay: { type: :integer },
                   imageUrl: { type: :string, nullable: true },
                   description: { type: :string }
                 }

          run_test!
        end

        response '422', 'invalid request' do
          let(:doctor) { { name: 'foo' } }
          run_test!
        end
      end
      get 'Get all doctors' do
        tags 'Doctors'
        consumes 'application/json', 'application/xml'
        security [Bearer: {}]
        parameter name: :Authorization, in: :header, type: :string

        response '200', 'All doctors fetched' do
          schema type: :object,
                 properties: {
                   message: { type: :array,
                              items: { type: :string } },
                   data: { type: :array,
                           items: { type: :object,
                                    properties: {
                                      id: { type: :string },
                                      name: { type: :string },
                                      hospital: { type: :string },
                                      specialization: { type: :string },
                                      costPerDay: { type: :integer },
                                      imageUrl: { type: :string, nullable: true },
                                      description: { type: :string }
                                    } } }

                 }
          run_test! do |response|
            json = JSON.parse(response.body)
            expect(json['data'].length).to be >= 2
            expect(json['message']).to eq(['All doctors loaded'])
          end
        end

        response '404', 'No doctors found' do
          schema type: :object,
                 properties: {
                   error: { type: :string },
                   error_message: { type: :array,
                                    items: { type: :string } }
                 }
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
