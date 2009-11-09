require 'erdvelaivis'

describe Erdvelaivis do
  before(:each) do
    @erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 15)
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
    @erdvelaivis.busena.should match(/Zeme|Kosmosas|Stotis|Else|Nukrites/i)
  end

  it "should have unique id" do
    @erdvelaivis.should respond_to(:id)
    erdvelaivis2 = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 100)
    @erdvelaivis.id.should_not == erdvelaivis2.id
  end
  
  it "should have 0 kosmonautai kai sukuriamas" do
    erdvelaivis2 = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 300)
    erdvelaivis2.keleiviai.should be_empty
  end

  it "should be able to nuskristi i stoti" do
    @erdvelaivis.skristi(100, 500, 'Stotis')
    @erdvelaivis.busena.should == 'Stotis'
  end

  it "should be able to nuskristi i Zeme" do
    @erdvelaivis.skristi(100, 500, 'Zeme')
    @erdvelaivis.busena.should == 'Zeme'
  end

  it "should be able to sekmingai nuskristi kai yra pakankamai kuro" do
    #kuro sanaudos 50
    erdvelaivis = Erdvelaivis.new('kuku', '1999-09-19', 20, 800, 5)
    erdvelaivis.skristi(150, 150, 'Zeme')
    erdvelaivis.busena.should == 'Zeme'
  end

  

  
end

