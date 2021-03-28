# frozen_string_literal: true

module Exceptions
  class CapacityFullException < StandardError
    def message
      'Parking Lot is Full'
    end
  end

  class WrongInputException < StandardError
    def message
      'Command not Found, please check the input command'
    end
  end

  class InvalidFileException < StandardError
    def message
      'Invalid input file'
    end
  end
end
