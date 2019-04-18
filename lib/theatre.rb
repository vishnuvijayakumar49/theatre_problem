class Theatre
  attr_accessor :screens, :bills
  def initialize(no_of_screens)
    @bills = []
    @screens = (1..no_of_screens).collect do |screen|
      screen = Screen.new(screen)
    end
  end

  def show_layout
    screens.each do |screen|
      puts "Show #{screen.number} Running in Audi #{screen.number}:"
      puts "All Seats:"
      screen.categories.each do |category|
        puts category.print_layout
      end
    end
  end

  def find_availability(screen_no, seats)
    screen_no = screen_no.to_i
    selected_screen = screens.select do |screen|
      screen.number == screen_no
    end
    return print_error("Invalid Show") if selected_screen.empty?
    avail_seats, seat_objs = selected_screen.first.check_seats_available(seats)
    booking_status(avail_seats, screen_no, seat_objs)    
  end

  def booking_status(avail_seats, screen_no, seat_objs)
    return print_error("Invalid seats") if avail_seats.nil?
    unavailable_seats = avail_seats.select{|k,v| v == false}
    return booking_procedure(screen_no, seat_objs) if unavailable_seats.empty?
    p "#{unavailable_seats.keys.join(',')} Not Available, Please select different seats"
  end

  def print_error(msg)
    p msg
  end

  def booking_procedure(screen_no, seat_objs)
    puts "Successfully Booked Show - #{screen_no}"
    total = seat_objs.reduce(0) do |sum, seat|
      seat.set_unavailable
      sum + Category.category_property[seat.category]
    end
    bill = Bill.new(total)
    bills << bill
    bill.display_details
  end

  def print_total_profit_details
    revenue, s_tax, swachh_barath, krishi_cess = [0,0,0,0]
    bills.each do |bill|
      revenue += bill.revenue
      s_tax += bill.s_tax
      swachh_barath += bill.swachh_barath_cess
      krishi_cess += bill.krishi_cess
    end
    puts  "Total Sales: "
    puts  "    Revenue: Rs. #{revenue.round(2)}"
    puts  "    Service Tax: Rs. #{s_tax.round(2)}"
    puts  "    Swachh Bharat Cess: Rs. #{swachh_barath.round(2)}"
    puts  "    Krishi Kalyan Cess: Rs. #{krishi_cess.round(2)}"
  end
end
