
require 'kosmonautas'


describe Kosmonautas do
   before(:each) do
    @kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
  end

  it "should have vardas" do
    @kosmonautas.should respond_to(:vardas)
  end

  it "should have bukle" do
    @kosmonautas.should respond_to(:bukle)
  end

  it "should have pavarde" do
    @kosmonautas.should respond_to(:pavarde)
  end

  it "should have gim_data" do
    @kosmonautas.should respond_to(:gim_data)
  end
  
  it "should have lytis" do
    @kosmonautas.should respond_to(:lytis)
  end

   it "should be vyras arba moteris" do
    @kosmonautas.lytis.should match(/Vyras|Moteris/i)
  end

  it "should have vieta" do
    @kosmonautas.should respond_to(:vieta)
  end

  it "should be centre, erdvelaivyje, kosmineje stotyje arba else" do
    @kosmonautas.vieta.should match(/Zeme|Erdvelaivis|Stotis|Else|Zuves/i)
  end

  it "should have ID" do
    @kosmonautas.should respond_to(:id)
  end

  it "should have unique ID" do
    kosmonautas2 = Kosmonautas.new('Tomas', 'Boka', '1200-11-22', 'Vyras', 70)
    @kosmonautas.id.should_not == kosmonautas2.id
  end

  it "should change bukle po skrydzio" do
    tmp = @kosmonautas.bukle
    @kosmonautas.pavargti()
    @kosmonautas.bukle.should < tmp
  end

  it "should have bukle ne daugiau uz 100" do
    @kosmonautas.bukle.should <= 100    
  end

  

  
end

