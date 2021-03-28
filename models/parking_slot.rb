# frozen_string_literal: true

require_relative './vehicle.rb'

class ParkingSlot
  attr_accessor :vehicle, :slot_number

  def initialize(slot_number)
    @slot_number = slot_number
  end

  def assign_vehicle(vehicle)
    self.vehicle = vehicle
  end

  def unassign_vehicle
    self.vehicle = nil
  end

  # Check availability of the parking slot
  def available?
    vehicle.nil?
  end
end
