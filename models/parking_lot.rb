# frozen_string_literal: true

require_relative './parking_slot.rb'
require_relative './vehicle.rb'
require_relative './../exceptions/exceptions.rb'

class ParkingLot
  attr_accessor :capacity, :parking_slots
  include Exceptions

  def initialize(capacity)
    @capacity = capacity
    @parking_slots = create_parking_slots
  end

  # Park the vehicle after finding an available slot, throws CapacityFullException if the Parking Lot is full
  def park(vehicle)
    raise CapacityFullException if current_capacity.zero?

    parking_slot = available_slot
    parking_slot.assign_vehicle(vehicle)
    parking_slot.slot_number
  end

  # Free the parking slot given the slot_number
  def unpark(slot_number)
    parking_slot = @parking_slots[slot_number]
    parking_slot.unassign_vehicle
  end

  private

  # Initialize Parking Lot by creating parking slots for the given capacity
  def create_parking_slots
    slots = {}
    @capacity.times do |slot_number|
      slots[slot_number + 1] = ParkingSlot.new(slot_number + 1) # to avoid slot number starting from zero.
    end
    slots
  end

  # Find the next available free slot to park the vehicle
  def available_slot
    @capacity.times do |slot_number|
      slot = @parking_slots[slot_number + 1]
      return slot if slot.available?
    end
  end

  # Returns the current capacity of parking lot
  def current_capacity
    @parking_slots.select { |_, slot| slot if slot.available? }.count
  end
end
