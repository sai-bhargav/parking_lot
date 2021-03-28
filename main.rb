# frozen_string_literal: true

require_relative './services/input_processor.rb'

class Main
  include Exceptions

  input_file_path = ARGV[0]
  input_processor = InputProcessor.new(nil)

  raise InvalidFileException unless File.file?(input_file_path)

  File.open(input_file_path, 'r') do |f|
    f.each_line do |line|
      input_processor.process(line)
    end
  end
end
