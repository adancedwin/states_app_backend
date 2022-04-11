# frozen_string_literal: true

module ApiHelper
  shared_examples_for 'json result' do
    before { subject }

    it 'returns JSON' do
      expect { JSON.parse(response.body) }.not_to raise_error
    end
  end

  shared_examples_for '400' do
    before { subject }

    it 'returns 400' do
      expect(response.status).to eq(400)
    end
  end

  shared_examples_for '401' do
    before { subject }

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

  shared_examples_for '201' do
    before { subject }

    it 'returns 201' do
      expect(response.status).to eq(201)
    end
  end

  shared_examples_for '200' do
    before { subject }

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  shared_examples_for 'contains error msg' do |msg|
    before { subject }

    it "error msg is #{msg}" do
      json = JSON.parse(response.body)
      expect(json['error_msg']).to eq(msg)
    end
  end

  # shared_examples_for 'only admins' do
  #   context 'without admin rights' do
  #     it 'is an unauthorized call' do
  #       api_call(params)
  #       expect(response.status).to eq(401)
  #     end
  #   end
  # end
end

RSpec.configuration.include(ApiHelper, type: :request)
