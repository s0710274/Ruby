

require 'administratorius'
require 'kosmonautas'

describe Administratorius do
  before(:each) do
    @admin = Administratorius.new
  end

  it "should have kosmonautai" do
    @admin.should respond_to(:kosmonautai)
  end

  it "should have kosmines stotys" do
    @admin.should respond_to(:stotys)
  end

  it "should have sveikatos centrai" do
    @admin.should respond_to(:centrai)
  end

  it "should have erdvelaiviai" do
    @admin.should respond_to(:erdvelaiviai)
  end

  it "should have skrydziai" do
    @admin.should respond_to(:skrydziai)
  end

  it 'should be able to prideti kosmonauta' do
    kosmonautas = Kosmonautas.new('vardenis', 'pavardenis', '1977-01-02', 'Vyras')
    @admin.should respond_to(:add_kosmonautas)
    @admin.add_kosmonautas(kosmonautas)
    @admin.kosmonautai[kosmonautas.id].should be_instance_of(Kosmonautas)
  end

  it 'should be able to prideti centra' do
    centras = Centras.new('poliklinika', 15, 3)
    @admin.should respond_to(:add_centras)
    @admin.add_centras(centras)
    @admin.centrai[centras.id].should be_instance_of(Centras)
  end

  it 'should be able to prideti erdvelaivi' do
    erdvelaivis = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
    @admin.should respond_to(:add_erdvelaivis)
    @admin.add_erdvelaivis(erdvelaivis)
    @admin.erdvelaiviai[erdvelaivis.id].should be_instance_of(Erdvelaivis)
  end

  it 'should be able to prideti kosmine stoti' do
    stotis = Kosmine_stotis.new('space station', 1234, 20)
    @admin.should respond_to(:add_stotis)
    @admin.add_stotis(stotis)
    @admin.stotys[stotis.id].should be_instance_of(Kosmine_stotis)
  end

  it 'should be able to prideti skrydis' do
    skrydis = Skrydis.new()
    @admin.should respond_to(:add_skrydis)
    @admin.add_skrydis(skrydis)
    @admin.skrydziai[skrydis.id].should be_instance_of(Skrydis)
  end

  it 'should be able to istrinti centra' do
    centras = Centras.new('poliklinika', 15, 3)
    @admin.should respond_to(:istrinti_centra)
    @admin.add_centras(centras)
    @admin.istrinti_centra(centras)
    @admin.centrai.should_not include(centras)
  end

  it 'should be able to istrinti erdvelaivi' do
    laivas = Erdvelaivis.new('C34-5D', '2001-01-12', 12, 3000)
    @admin.should respond_to(:istrinti_erdvelaivi)
    @admin.add_erdvelaivis(laivas)
    @admin.istrinti_erdvelaivi(laivas)
    @admin.erdvelaiviai.should_not include(laivas)
  end

  it 'should be able to istrinti stoti' do
    stotis = Kosmine_stotis.new('space station', 1234, 20)
    @admin.should respond_to(:istrinti_stoti)
    @admin.add_stotis(stotis)
    @admin.istrinti_stoti(stotis)
    @admin.stotys.should_not include(stotis)
  end

  it 'should be able to istrinti kosmonautas' do
    kosmonautas = Kosmonautas.new('vardenis', 'pavardenis', '1977-01-02', 'Vyras')
    @admin.should respond_to(:istrinti_kosmonauta)
    @admin.add_kosmonautas(kosmonautas)
    @admin.istrinti_kosmonauta(kosmonautas)
    @admin.kosmonautai.should_not include(kosmonautas)
  end

  it 'should be able to istrinti skrydi' do
    skrydis = Skrydis.new()
    @admin.should respond_to(:istrinti_skrydi)
    @admin.add_skrydis(skrydis)
    @admin.istrinti_skrydi(skrydis)
    @admin.skrydziai.should_not include(skrydis)
  end



end

