# frozen_string_literal: true

require 'pry-byebug'

# This is the Car class
class Car
  attr_accessor :color
  attr_reader :model

  # Sacred method that gets executed when we do Car.new
  def initialize(model, color, year, origin)
    @model = model
    @color = color
    @year  = year
    @origin = origin

    @engine_started = false
    @wheels = 4
  end

  def start_engine
    @engine_started = true
    puts 'Starting the car now.. Put your seatbelts'
  end

  def running?
    @engine_started
  end

  def brief_history
    "The #{@model} from #{@year} was built in #{@origin}, and it's color is #{@color}"
  end
end

joao_car = Car.new('Audi', 'Black', 2020, 'Germany')
renata_car = Car.new('Fusca', 'Yellow', 2020, 'Manguinhos')

joao_car.running? # => false
joao_car.running? # => false
joao_car.running? # => false
joao_car.start_engine
joao_car.running? # => true

binding.pry

joao_car.start_engine
