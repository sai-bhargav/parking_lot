# frozen_string_literal: true

require_relative './parking_service.rb'
require_relative './../models/parking_lot.rb'

class InputProcessor
  include Exceptions

  def initialize(parking_service)
    @parking_service = parking_service
  end

  def process(input_command)
    command = input_command.split(' ').first

    case command
    when 'Create_parking_lot'
      create_parking_lot(input_command)

    when 'Park'
      park_vehicle(input_command)

    when 'Leave'
      unpark_vehicle(input_command)

    when 'Slot_numbers_for_driver_of_age'
      slot_numbers_by_age(input_command)

    when 'Slot_number_for_car_with_number'
      slot_numbers_by_car(input_command)

    when 'Vehicle_registration_number_for_driver_of_age'
      registrations_by_driver_age(input_command)

    else
      raise WrongInputException
    end
  end

  private

  def park_vehicle(input_command)
    inputs = input_command.split(' ')
    slot_number = @parking_service.park_vehicle(inputs[1], inputs[3].to_i)
    p "Vehicle parked in slot #{slot_number}"
  end

  def unpark_vehicle(input_command)
    inputs = input_command.split(' ')
    @parking_service.unpark_vehicle(inputs[1].to_i)
    p 'Vehicle removed from parking slot'
  end

  def slot_numbers_by_age(input_command)
    inputs = input_command.split(' ')
    slot_numbers = @parking_service.slots_by_driver_age(inputs[1].to_i)
    p "Slot numbers with driver of age #{inputs[1].to_i} is  #{slot_numbers}"
  end

  def slot_numbers_by_car(input_command)
    inputs = input_command.split(' ')
    slot_numbers = @parking_service.slots_by_vehicle_registration(inputs[1])
    p "Vehicle with registration #{inputs[1]} is parked in slot #{slot_numbers.join(', ')}"
  end

  def registrations_by_driver_age(input_command)
    inputs = input_command.split(' ')
    car_registrations = @parking_service.vehicles_by_driver_age(inputs[1].to_i)
    p "Vehicle registration numbers with driver of age #{inputs[1].to_i} is #{car_registrations.join(', ')}"
  end

  def create_parking_lot(input_command)
    inputs = input_command.split(' ')
    parking_lot = ParkingLot.new(inputs[1].to_i)
    @parking_service = ParkingService.new(parking_lot)
    p "Created Parking Lot with #{inputs[1].to_i} slots"
  end
end
