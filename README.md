# Parking Lot Design

## Dependencies:
  - Ruby
  - Bundler
  - Rspec

## Setup:
  Run the setup script to install ruby and bundler if its not available on your system.
  
    ./script.sh
    
  If the file dosen't have permissions to run, give permissions by running `chmod +x setup.sh`

## Executing the code:
  Go into the parking_lot directory, run the following command passing file path of the test file as argument (without '<' '>').
  
    ruby main.rb <input_file_path>

## Tests:
  Full test suite can be run using rspec using following command
  
    rspec tests/

