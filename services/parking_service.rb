# frozen_string_literal: true

require_relative './../models/vehicle.rb'

class ParkingService
  def initialize(parking_lot)
    @parking_lot = parking_lot
  end

  # Park the vehicle given the registration and drivers_age
  def park_vehicle(registration, driver_age)
    vehicle = Vehicle.new(registration, driver_age)
    @parking_lot.park(vehicle)
  end

  # Unpark the vehicle given the slot number
  def unpark_vehicle(slot_number)
    @parking_lot.unpark(slot_number)
  end

  # Fetch all the vehicle registrations given drivers_age
  def vehicles_by_driver_age(driver_age)
    registration_numbers = []

    @parking_lot.parking_slots.each do |_, parking_slot|
      if parking_slot.vehicle && parking_slot.vehicle.driver_age == driver_age
        registration_numbers << parking_slot.vehicle.registration
      end
    end
    registration_numbers
  end

  # Fetch slot number of vehicle given the vehicle registration
  def slots_by_vehicle_registration(registration)
    slot_numbers = []

    @parking_lot.parking_slots.each do |slot_number, parking_slot|
      if parking_slot.vehicle && parking_slot.vehicle.registration == registration
        slot_numbers << slot_number
      end
    end
    slot_numbers
  end

  # Fetch all the parking slot numbers given driver_age
  def slots_by_driver_age(driver_age)
    slot_numbers = []

    @parking_lot.parking_slots.each do |slot_number, parking_slot|
      if parking_slot.vehicle && parking_slot.vehicle.driver_age == driver_age
        slot_numbers << slot_number
      end
    end
    slot_numbers
  end
end
