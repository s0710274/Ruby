

require 'naudotojas'
require 'kosmonautas'
require 'erdvelaivis'
require 'matchers'

describe Naudotojas do
  before(:each) do
    @user = Naudotojas.new
  end
  
  it "should have kosmonautai" do
    @user.should respond_to(:kosmonautai)
  end

  it "should have kosmines stotys" do
    @user.should respond_to(:stotys)
  end

  it "should have sveikatos centrai" do
    @user.should respond_to(:centrai)
  end

  it "should have erdvelaiviai" do
    @user.should respond_to(:erdvelaiviai)
  end
  
  it 'should be able to prideti kosmonauta' do
    kosmonautas = Kosmonautas.new('vardenis', 'pavardenis', '1977-01-02', 'Vyras', 50)
    @user.should respond_to(:add_kosmonautas)
    @user.add_kosmonautas(kosmonautas)
    @user.kosmonautai[kosmonautas.id].should be_instance_of(Kosmonautas)
  end

  it 'should be able to prideti centra' do
    centras = Centras.new('poliklinika', 15)
    @user.should respond_to(:add_centras)
    @user.add_centras(centras)
    @user.centrai[centras.id].should be_instance_of(Centras)
  end

  it 'should be able to prideti erdvelaivi' do
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    @user.should respond_to(:add_erdvelaivis)
    @user.add_erdvelaivis(erdvelaivis)
    @user.erdvelaiviai[erdvelaivis.id].should be_instance_of(Erdvelaivis)
  end

  it 'should be able to prideti kosmine stoti' do
    stotis = Kosmine_stotis.new('space station', 1234, 20)
    @user.should respond_to(:add_stotis)
    @user.add_stotis(stotis)
    @user.stotys[stotis.id].should be_instance_of(Kosmine_stotis)
  end

  it 'should be able to istrinti centra' do
    centras = Centras.new('poliklinika', 15)
    @user.should respond_to(:istrinti_centra)
    @user.add_centras(centras)
    @user.istrinti_centra(centras)
    @user.centrai.should_not include(centras)
  end

  it 'should be able to istrinti erdvelaivi' do
    laivas = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    @user.should respond_to(:istrinti_erdvelaivi)
    @user.add_erdvelaivis(laivas)
    @user.istrinti_erdvelaivi(laivas)
    @user.erdvelaiviai.should_not include(laivas)
  end

  it 'should be able to istrinti stoti' do
    stotis = Kosmine_stotis.new('space station', 1234, 20)
    @user.should respond_to(:istrinti_stoti)
    @user.add_stotis(stotis)
    @user.istrinti_stoti(stotis)
    @user.stotys.should_not include(stotis)
  end

  it 'should be able to istrinti kosmonautas' do
    kosmonautas = Kosmonautas.new('vardenis', 'pavardenis', '1977-01-02', 'Vyras', 70)
    @user.should respond_to(:istrinti_kosmonauta)
    @user.add_kosmonautas(kosmonautas)
    @user.istrinti_kosmonauta(kosmonautas)
    @user.kosmonautai.should_not include(kosmonautas)
  end

  it "should be able to isodinti kosmonauta i kosmini laiva" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    kosmonautas.bukle.should > 70 #kai bukle >70 tada galima skristi
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    erdvelaivis.keleiviai.should include(kosmonautas.id)
    kosmonautas.vieta.should == 'Erdvelaivis'
  end

  it "should raise exeption 'kosmonautas blogai jauciasi' jeigu bukele <= 70" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 60)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    lambda {
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    }.should raise_error
  end

  it "should let isodinti kosmonauta, jeigu laive yra vietos" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 1, 3000, 200)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    erdvelaivis.keleiviai.length.should <= erdvelaivis.vietos
  end


  it "should raise exeption 'kosmonautas netelpa i laiva" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 0, 3000, 200)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    lambda {
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    }.should raise_error
  end


  it "should be able to islaipinti kosmonauta" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    @user.islaipinti_kosmonauta(kosmonautas.id)
    erdvelaivis.keleiviai.should_not include(kosmonautas.id)
  end

  it "should raise exeption 'kosmonautas nera jokiame laive'" do
    kosmonautas = Kosmonautas.new('Vardenis3', 'Pavardenis3', '1970-10-10', 'Vyras', 80)
    @user.add_kosmonautas(kosmonautas)
    lambda {
    @user.islaipinti_kosmonauta(kosmonautas.id)
    }.should raise_error    
  end

  it "should change kosmonauto buvimo vieta islipus i zeme jei laivas nusileides" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    erdvelaivis.busena = 'Zeme'
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    @user.islaipinti_kosmonauta(kosmonautas.id)
    kosmonautas.vieta.should == 'Zeme'
  end

  it "should change kosmonauto buvimo vieta islipus i stotis jei laivas stotyje" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    erdvelaivis.busena = 'Stotis'
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    @user.islaipinti_kosmonauta(kosmonautas.id)
    kosmonautas.vieta.should == 'Stotis'
  end

  it "should not allow to isodinti kosmonauta, jeigu jis jau yra kitame laive" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    erdvelaivis2 = Erdvelaivis.new('C34-52D', '2001-01-12', 12, 3000, 200)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    @user.add_erdvelaivis(erdvelaivis2)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    lambda {
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis2.id)
    }
    @user.erdvelaiviai[erdvelaivis2.id].keleiviai.should_not include(kosmonautas.id)
  end

  it "should raise error 'kosmonautas jau ilipes i kita laiva'" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    erdvelaivis2 = Erdvelaivis.new('C34-52D', '2001-01-12', 12, 3000, 200)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    @user.add_erdvelaivis(erdvelaivis2)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    lambda {
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis2.id)
    }.should raise_error
  end

  it "should be able to nuskristi i stoti" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    stotis = Kosmine_stotis.new('space station', 123, 20)
    @user.add_erdvelaivis(erdvelaivis)
    @user.add_kosmonautas(kosmonautas)
    @user.add_stotis(stotis)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    kuras = 10000
    @user.paleisti_laiva(erdvelaivis.id, stotis.id, kuras)
    erdvelaivis.busena.should == 'Stotis'
  end

  it "should be able to nuskristi i zeme" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    stotis = Kosmine_stotis.new('space station', 123, 20)
    @user.add_erdvelaivis(erdvelaivis)
    @user.add_kosmonautas(kosmonautas)
    @user.add_stotis(stotis)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    kuras = 10000
    @user.paleisti_laiva(erdvelaivis.id, stotis.id, kuras)#nuskrendam i stoti
    @user.paleisti_laiva(erdvelaivis.id, stotis.id, kuras)#turim grizti atgal
    erdvelaivis.busena.should == 'Zeme'
  end

  it "should not let to paleisti laiva, kai jame nera kosmonautu" do
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    stotis = Kosmine_stotis.new('space station', 123, 20)
    @user.add_erdvelaivis(erdvelaivis)
    @user.add_stotis(stotis)
    kuras = 10000
    pradine_busena = erdvelaivis.busena
    lambda{
    @user.paleisti_laiva(erdvelaivis.id, stotis.id, kuras)   
    }
    erdvelaivis.busena.should == pradine_busena
  end

  it "should raise error 'norima paleisti tuscia laiva'" do
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    stotis = Kosmine_stotis.new('space station', 123, 20)
    @user.add_erdvelaivis(erdvelaivis)
    @user.add_stotis(stotis)
    kuras = 10000
    pradine_busena = erdvelaivis.busena
    lambda{
    @user.paleisti_laiva(erdvelaivis.id, stotis.id, kuras)
    }.should raise_error
  end

  it "should raise error jei erdvelaivis nukrito ir pakeisti kosmonautu busenas i 'Zuves'" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000, 200)
    stotis = Kosmine_stotis.new('space station', 123, 20)
    @user.add_erdvelaivis(erdvelaivis)
    @user.add_kosmonautas(kosmonautas)
    @user.add_stotis(stotis)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    kuras = 0 #be kuro, kad nukristu
    lambda{
      @user.paleisti_laiva(erdvelaivis.id, stotis.id, kuras)
    }.should raise_error
    kosmonautas.vieta.should == 'Zuves'    
  end


  
end

