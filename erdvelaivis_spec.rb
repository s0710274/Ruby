require 'erdvelaivis'

describe Erdvelaivis do
  before(:each) do
    @erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
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

  it "should have greitis" do
    @erdvelaivis.should respond_to(:greitis)
  end
  
end

