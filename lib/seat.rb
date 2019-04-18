class Seat
  attr_accessor :status, :number, :category
  def initialize(number, cat)
    @status = 'available'
    @number = number
    @category = cat
  end
  
  def available?
    status == 'available'
  end

  def set_unavailable
    @status = 'unavailable'
  end
end