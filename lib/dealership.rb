class Dealership
  attr_reader :name, :address, :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.count
  end

  def add_car(car)
    @inventory.push(car)
    # @inventory << car
  end

  def has_inventory?
    inventory_count != 0
    # if inventory_count = 0
    #   false
    # end
  end

  def cars_by_make(the_make)
    inventory.find_all do |car|
      car.make == the_make
    end

    # .find_all = [] of the object(s)
    # .select = [] OR {} of the object(s)

    ###################

    # all_make_cars = []

    # inventory.each do |car|
    #   if car.make == the_make
    #     all_make_cars << car
    #   end
    # end

    # all_make_cars
  end

  def total_value
    array_of_total_costs = []

    inventory.each do |car|
      array_of_total_costs << car.total_cost 
    end

    array_of_total_costs.sum
  end

  def details
    {"total_value" => total_value, "address" => address}
  end
end