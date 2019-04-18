#This file execute all different cases and print the output.
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
t = Theatre.new(3)

def test_case(t, screen, seats)
  t.show_layout
  screen = screen
  seats = seats
  puts "\nEnter Show no: #{screen}"
  puts "Enter seats: #{seats}\n\n"
  seats = seats.split(',').map(&:strip)
  t.find_availability(screen, seats)
  puts "\n\n<<<<<<< Next test case >>>>>>>>\n\n"
end

test_case(t, 1 ,"A1, A2, A3") #successfull booking
test_case(t, 1 ,"A1, A2, C3") #Error in booking while booking allocated seats
test_case(t, 3 ,"A1, B2, B3") #Successfull booking in another screen
test_case(t, 5 ,"A1, A2, A3") #Error in booking due to wrong screen number



t.print_total_profit_details
