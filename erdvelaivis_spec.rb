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

  it "should have kosmonautu skaicius" do
    @erdvelaivis.should respond_to(:kosmonautu_sk)
  end

  it "should be zemeje, pakiles, skrenda arba else" do
    @erdvelaivis.busena.should match(/Zemeje|Pakiles|Skrenda|Else/i)
  end

  



end

