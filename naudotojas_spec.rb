

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

  it "should have skrydziai" do
    @user.should respond_to(:skrydziai)
  end

  it 'should be able to prideti kosmonauta' do
    kosmonautas = Kosmonautas.new('vardenis', 'pavardenis', '1977-01-02', 'Vyras', 50)
    @user.should respond_to(:add_kosmonautas)
    @user.add_kosmonautas(kosmonautas)
    @user.kosmonautai[kosmonautas.id].should be_instance_of(Kosmonautas)
  end

  it 'should be able to prideti centra' do
    centras = Centras.new('poliklinika', 15, 3)
    @user.should respond_to(:add_centras)
    @user.add_centras(centras)
    @user.centrai[centras.id].should be_instance_of(Centras)
  end

  it 'should be able to prideti erdvelaivi' do
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
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

  it 'should be able to prideti skrydis' do
    skrydis = Skrydis.new()
    @user.should respond_to(:add_skrydis)
    @user.add_skrydis(skrydis)
    @user.skrydziai[skrydis.id].should be_instance_of(Skrydis)
  end

  it 'should be able to istrinti centra' do
    centras = Centras.new('poliklinika', 15, 3)
    @user.should respond_to(:istrinti_centra)
    @user.add_centras(centras)
    @user.istrinti_centra(centras)
    @user.centrai.should_not include(centras)
  end

  it 'should be able to istrinti erdvelaivi' do
    laivas = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
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

  it 'should be able to istrinti skrydi' do
    skrydis = Skrydis.new()
    @user.should respond_to(:istrinti_skrydi)
    @user.add_skrydis(skrydis)
    @user.istrinti_skrydi(skrydis)
    @user.skrydziai.should_not include(skrydis)
  end

  it "should be able to isodinti kosmonauta i kosmini laiva" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    kosmonautas.bukle.should > 70 #kai bukle >70 tada galima skristi
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    erdvelaivis.keleiviai.should include(kosmonautas.id)
    kosmonautas.vieta.should == 'Erdvelaivis'
  end

  it "should raise exeption 'kosmonautas blogai jauciasi' jeigu bukele <= 70" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 60)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    lambda {
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    }.should raise_error
  end

  it "should let isodinti kosmonauta, jeigu laive yra vietos" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 1, 3000)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    erdvelaivis.keleiviai.length.should <= erdvelaivis.vietos
  end

  #ar yra tikrinama ar prisidejo prie uzimamu vietu?

  it "should raise exeption 'kosmonautas netelpa i laiva" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 0, 3000)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    lambda {
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    }.should raise_error
  end


  it "should be able to islaipinti kosmonauta" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
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

  it "should change kosmonauto buvimo vieta islipus" do
    kosmonautas = Kosmonautas.new('Vardenis', 'Pavardenis', '1970-10-10', 'Vyras', 80)
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
    @user.add_kosmonautas(kosmonautas)
    @user.add_erdvelaivis(erdvelaivis)
    @user.isodinti_kosmonauta(kosmonautas.id, erdvelaivis.id)
    @user.islaipinti_kosmonauta(kosmonautas.id)
    kosmonautas.vieta.should priklausyti('Zeme', 'Stotis')
  end


#islipus is laivo pasikeicia kosmonauto busena



  #vienu metu kosmonautas gali buti tik viename laive

end

