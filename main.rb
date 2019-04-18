
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
t = Theatre.new(3)
loop do
  t.show_layout
  puts "Enter Show no:"
  screen = gets.chomp
  puts "Enter seats:"
  seats = gets.chomp
  seats = seats.split(',').map(&:strip)
  t.find_availability(screen, seats)
  puts "Do you want to book again(y/n)"
  repeat_booking = gets.chomp
  break if repeat_booking.downcase == 'n'
end
t.print_total_profit_details