require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
  # let(:dealership) { Dealership.new("Acme Auto", "123 Main Street") }
  # let(:car_1) { Car.new("Ford Mustang", 1500, 36) }
  # let(:car_2) { Car.new("Toyota Prius", 1000, 48) }

  xit 'exists' do
    expect(dealership).to be_instance_of(Dealership)
  end

  xit 'has attributes' do
    expect(dealership.name).to eq("Acme Auto")
    expect(dealership.address).to eq("123 Main Street")
  end

  xit 'has inventory' do
    expect(dealership.inventory).to eq([])
  end

  xit 'should count inventory' do 
    expect(dealership.inventory_count).to eq(0)
  end

  xit 'add cars to inventory' do
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    expect(dealership.inventory).to eq([car_1, car_2])
  end

  xit 'should return newly added inventory in its count' do
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    expect(dealership.inventory_count).to eq(2)
  end

  it 'should return false if it has not inventory' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    
    expect(dealership.has_inventory?).to eq(false)
  end

  it 'should return true if it has cars in its inventory' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)

    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)

    expect(dealership.has_inventory?).to eq(true)
  end

  it 'should show cars by make' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)

    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)

    expect(dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
    expect(dealership.cars_by_make("Ford")).to eq([car_1])
  end

  it 'should give total value' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)

    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)

    expect(dealership.total_value).to eq(156000)
  end

  it 'should give total value' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)

    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)

    expect(dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
  end
end