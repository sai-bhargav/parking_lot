# frozen_string_literal: true

require_relative './../../models/parking_lot.rb'

describe ParkingLot do
  before(:each) do
    @parking_lot = ParkingLot.new(5)
    @vehicle_1 = Vehicle.new('KA-01-HH-1234', 25)
    @vehicle_2 = Vehicle.new('GJ-07-AU-5623', 23)
  end

  it 'should park the vehicle' do
    @parking_lot.park(@vehicle_1)
    @parking_lot.park(@vehicle_2)

    expect(@parking_lot.capacity).to eq 5
    expect(@parking_lot.parking_slots[1].vehicle.registration).to eq('KA-01-HH-1234')
    expect(@parking_lot.parking_slots[1].vehicle.driver_age).to eq 25
  end

  it 'should unpark the vehicle' do
    @parking_lot.unpark(1)

    expect(@parking_lot.capacity).to eq 5
    expect(@parking_lot.parking_slots[1].available?).to eq true
  end
end
