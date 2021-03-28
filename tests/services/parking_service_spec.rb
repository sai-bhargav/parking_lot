# frozen_string_literal: true

require_relative './../../models/parking_lot.rb'
require_relative './../../models/vehicle.rb'
require_relative './../../services/parking_service.rb'

describe ParkingService do
  before(:each) do
    @parking_lot = ParkingLot.new(5)
    vehicle_1 = Vehicle.new('KA-01-HH-1234', 54)
    vehicle_2 = Vehicle.new('GJ-03-AU-5623', 23)
    vehicle_3 = Vehicle.new('AP-09-RS-1673', 25)
    vehicle_4 = Vehicle.new('MH-17-AF-7363', 33)
    vehicle_5 = Vehicle.new('NG-11-KE-9384', 23)

    @parking_lot.park(vehicle_1)
    @parking_lot.park(vehicle_2)
    @parking_lot.park(vehicle_3)
    @parking_lot.park(vehicle_4)
    @parking_lot.park(vehicle_5)
    @parking_service = ParkingService.new(@parking_lot)
  end

  it 'should fetch registration numbers for given driver age' do
    expect(@parking_service.vehicles_by_driver_age(23).count).to eq 2
    expect(@parking_service.vehicles_by_driver_age(23)).to match_array(['NG-11-KE-9384','GJ-03-AU-5623'])
    expect(@parking_service.vehicles_by_driver_age(65)).to match_array([])
  end

  it 'should fetch slot numbers for given registration number' do
    expect(@parking_service.slots_by_vehicle_registration('AP-09-RS-1673')).to match_array([3])
    expect(@parking_service.slots_by_vehicle_registration('AP-09-RS-1273')).to match_array([])
  end

  it 'should fetch slot numbers for given registration number' do
    expect(@parking_service.slots_by_driver_age(23).count).to eq 2
    expect(@parking_service.slots_by_driver_age(23)).to match_array([2,5])
    expect(@parking_service.slots_by_driver_age(65)).to match_array([])
  end
end
