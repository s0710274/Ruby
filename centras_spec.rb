# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'centras'

describe Centras do
  before(:each) do
    @centras = Centras.new('ssc', 20, 3)
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
  


end

