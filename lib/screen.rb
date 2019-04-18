class Screen
  attr_accessor :categories, :number
  def initialize(number)
    @number = number
    @categories = Category.category_property.collect do |cat, price|
      Category.new(cat, price, 9)
    end
  end

  def check_seats_available(sel_seats)
    avail_seats = []
    categories.collect do |cat|
      avail_seats << cat.seats.select do |seat|
        sel_seats.include?(seat.number)
      end
    end
    avail_seats.flatten!.compact!
    return seat_availability_status(avail_seats, sel_seats), avail_seats unless avail_seats.empty?
    p "#{sel_seats.join(',')} Not Available, Please select different seats"
  end


  def seat_availability_status(seats, sel_seats)
    seat_arr = {}
    available_seats = seats.collect do |seat|
      available = seat.available?
      seat_arr[seat.number] = available
      available
    end
    invalid_seats = sel_seats - seat_arr.keys
    invalid_seats.each{|seat| seat_arr[seat] = false}
    seat_arr
  end
end