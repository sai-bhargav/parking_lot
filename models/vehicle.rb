# frozen_string_literal: true

class Vehicle
  attr_accessor :registration, :driver_age

  def initialize(registration, driver_age)
    @registration = registration
    @driver_age = driver_age
  end
end
