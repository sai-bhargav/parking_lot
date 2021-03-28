# frozen_string_literal: true

require_relative './../../models/vehicle.rb'

describe Vehicle do
  it 'should create vehicle' do
    vehicle = Vehicle.new('PB-01-HH-1234', 23)

    expect(vehicle.registration).to eq 'PB-01-HH-1234'
    expect(vehicle.driver_age).to eq 23
  end
end
