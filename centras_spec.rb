
require 'centras'

describe Centras do
  before(:each) do
    @centras = Centras.new('ssc', 20)
  end

  it "should have pavadinimas" do
    @centras.should respond_to(:pavadinimas)
  end

  it "should have vietu skaicius" do
    @centras.should respond_to(:vietu_sk)
  end

  it "should have ligoniu skaicius" do
    @centras.should respond_to(:ligoniu_sk)
  end

  it "should have id" do
    @centras.should respond_to(:id)
  end

  it "should have unique ID" do
    centras2 = Centras.new('Ligonine', 10)
    @centras.id.should_not == centras2.id
  end
  


end

