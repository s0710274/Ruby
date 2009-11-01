# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'kosmonautas'

describe Kosmonautas do
   before(:each) do
    @kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras')
  end

  it "should have vardas" do
    @kosmonautas.should respond_to(:vardas)
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
    @kosmonautas.vieta.should match(/Centras|Erdvelaivis|Stotis|Else/i)
  end


  
end

