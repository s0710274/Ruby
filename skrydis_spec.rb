
require 'skrydis'

describe Skrydis do
  before(:each) do
    @skrydis = Skrydis.new
  end

  it "should have isvykimo data" do
    @skrydis.should respond_to(:isvykimo_data)
  end

  it "should have isvykimo laikas" do
    @skrydis.should respond_to(:isvykimo_laikas)
  end

  it "should have nusileidimo data" do
    @skrydis.should respond_to(:nusileidimo_data)
  end

  it "should have nusileidimo laikas" do
    @skrydis.should respond_to(:nusileidimo_laikas)
  end

  it "should have isvykimo vieta" do
    @skrydis.should respond_to(:isvykimo_vieta)
  end

  it "should have nusileidimo vieta" do
    @skrydis.should respond_to(:nusileidimo_vieta)
  end

  it "should have planuojama trukme" do
    @skrydis.should respond_to(:plan_trukme)
  end

  it "should be able to change isvykimo data" do
    @skrydis.should respond_to(:nauja_isvykimo_data)
  end

  it "should be able to change isvykimo laikas" do
    @skrydis.should respond_to(:naujas_isvykimo_laikas)
  end

  it "should be able to change nusileidimo data" do
    @skrydis.should respond_to(:nauja_nusileidimo_data)
  end

  it "should be able to change nusileidimo laikas" do
    @skrydis.should respond_to(:naujas_nusileidimo_laikas)
  end

  it "should be able to change isvykimas" do
    @skrydis.should respond_to(:naujas_isvykimas)
  end

  it "should be able to change nusileidimas" do
    @skrydis.should respond_to(:naujas_nusileidimas)
  end

  it "should have unique id" do
    @skrydis.should respond_to(:id)
    skrydis = Skrydis.new()
    @skrydis.id.should_not == skrydis.id
  end



end

