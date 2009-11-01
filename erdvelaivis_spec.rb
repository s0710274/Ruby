require 'erdvelaivis'

describe Erdvelaivis do
  before(:each) do
    @erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12)
  end

  it "should have modelis" do
    @erdvelaivis.should respond_to(:modelis)
  end

  it "should have pagaminimo data" do
    @erdvelaivis.should respond_to(:pagaminimo_data)
  end

  it "should have vietos" do
    @erdvelaivis.should respond_to(:vietos)
  end
  
end

