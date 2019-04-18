class Bill
  attr_accessor :revenue, :s_tax, :swachh_barath_cess, :krishi_cess
  def initialize(revenue)
    @revenue = revenue
    @s_tax = find_percnt(revenue, 14.0)
    @swachh_barath_cess = find_percnt(revenue, 0.5)
    @krishi_cess = find_percnt(revenue, 0.5)
  end

  def find_percnt(total, percent)
    (total * (percent / 100)).round(2)
  end

  def display_details
    p "SubTotal: Rs. #{revenue}"
    p "Service Tax @14%: Rs. #{s_tax}"
    p "Swachh Bharat Cess @0.5%: Rs. #{swachh_barath_cess}"
    p "Krishi Kalyan Cess @0.5%: Rs. #{krishi_cess}"
    p "Total: Rs. #{find_percnt(revenue, 15) + revenue}"
  end
end
