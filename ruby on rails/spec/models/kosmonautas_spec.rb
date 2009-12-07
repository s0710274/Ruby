require 'spec_helper'

describe Kosmonautas do
  fixtures :kosmonautas
 
  before(:each) do
    @kosmonautas = kosmonautas(:pirmas)
  end
  
  it 'should have vardas' do
    @kosmonautas.vardas.should == 'Petras'
  end
end
