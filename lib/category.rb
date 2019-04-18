class Category
  attr_accessor :name, :seats, :price
  def initialize(name, price, seats)
    @seats = (1..seats).collect do |seat|
      num = seat_number(name, seat)
      Seat.new(num, name)
    end
  end

  def seat_number(cat, number)
    name = case cat
    when 'platinum' then "A#{number}"
    when 'gold' then "B#{number}"
    when 'silver' then "C#{number}"
    end
  end

  def print_layout
    layout = ''
    seats.each do |seat|
      seat = seat.available? ? seat.number : '  '
      layout += seat + '  '
    end
    layout
  end

  def self.category_property
    {'platinum' => 320, 'gold' => 280, 'silver' =>240}
  end
end
