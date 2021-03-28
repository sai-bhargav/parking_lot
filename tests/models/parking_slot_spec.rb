# frozen_string_literal: true

require_relative './../../models/vehicle.rb'
require_relative './../../models/parking_slot.rb'

describe ParkingSlot do
  it 'should create vehicle' do
    vehicle = Vehicle.new('PB-01-HH-1234', 23)
    parking_slot = ParkingSlot.new(1)
    parking_slot.vehicle = vehicle

    expect(parking_slot.slot_number).to eq 1
    expect(parking_slot.vehicle.registration).to eq 'PB-01-HH-1234'
    expect(parking_slot.vehicle.driver_age).to eq 23
  end
end
