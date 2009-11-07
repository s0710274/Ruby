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
    @erdvelaivis.should respond_to(:keleiviai)
  end

  it "should be zemeje, pakiles, skrenda arba else" do
    @erdvelaivis.busena.should match(/Zeme|Kosmosas|Stotis|Else/i)
  end

  it "should have unique id" do
    @erdvelaivis.should respond_to(:id)
    erdvelaivis2 = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
    @erdvelaivis.id.should_not == erdvelaivis2.id
  end
  
  it "should have 0 kosmonautai kai sukuriamas" do
    erdvelaivis2 = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
    erdvelaivis2.keleiviai.should be_empty
  end


end

