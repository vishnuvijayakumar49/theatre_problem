
Dir[File.expand_path('./lib/*.rb')].each {|file| require file }

RSpec.describe Theatre do
  let(:theatre) { Theatre.new(3) }
  let(:invalid_screen) {6}
  let(:screen) {1}
  let(:seats) {["A2","A3"]}
  let(:invalid_seats) {["A2","D1"]}


  it "Should return Invalid show response" do
  	response = theatre.find_availability(invalid_screen, seats)
    expect(response).to eq('Invalid Show')
  end

  it "Should return Invalid seats response" do
  	response = theatre.find_availability(screen, invalid_seats)
    expect(response).to eq('D1 Not Available, Please select different seats')
  end

  it "Should return successfull response" do
  	response = theatre.find_availability(screen, seats)
    expect(response).to include("Total")
  end

end
