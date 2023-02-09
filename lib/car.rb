class Car
  attr_reader :make_model, 
              :make, 
              :model, 
              :monthly_payment, 
              :loan_length, 
              :color
  
  def initialize(make_model = make | model, monthly_payment, loan_length)
    @make = make_model.split[0]
    @model = make_model.split[1]
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @color = nil
  end
  
  def total_cost
    @monthly_payment * @loan_length
  end
  
  def paint!(hue)
    @color = hue
  end
end