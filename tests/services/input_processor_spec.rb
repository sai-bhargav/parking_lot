# frozen_string_literal: true

require_relative './../../models/parking_lot.rb'
require_relative './../../models/vehicle.rb'
require_relative './../../services/input_processor.rb'

describe InputProcessor do
  before(:each) do
    @parking_lot = ParkingLot.new(6)
    @parking_service = ParkingService.new(@parking_lot)
    @input_processor = InputProcessor.new(@parking_service)
  end

  it 'should call create_parking_lot method' do
    command = 'Create_parking_lot 6'
    expect(@input_processor).to receive(:create_parking_lot).with(command)
    @input_processor.process(command)
  end

  it 'should call park_vehicle method' do
    command = 'Park KA-01-HH-1234 driver_age 21'
    expect(@input_processor).to receive(:park_vehicle).with(command)
    @input_processor.process(command)
  end

  it 'should call unpark_vehicle method' do
    command = 'Leave 2'
    expect(@input_processor).to receive(:unpark_vehicle).with(command)
    @input_processor.process(command)
  end

  it 'should call slot_numbers_by_age method' do
    command = 'Slot_numbers_for_driver_of_age 21'
    expect(@input_processor).to receive(:slot_numbers_by_age).with(command)
    @input_processor.process(command)
  end

  it 'should call slot_numbers_by_car method' do
    command = 'Slot_number_for_car_with_number PB-01-HH-1234'
    expect(@input_processor).to receive(:slot_numbers_by_car).with(command)
    @input_processor.process(command)
  end

  it 'should call registrations_by_driver_age method' do
    command = 'Vehicle_registration_number_for_driver_of_age 18'
    expect(@input_processor).to receive(:registrations_by_driver_age).with(command)
    @input_processor.process(command)
  end
end
