require 'kosmine_stotis'

describe Kosmine_stotis do
  before(:each) do
    @kosmine_stotis = Kosmine_stotis.new('space station', 1234, 20)
  end

  it "should have pavadinimas" do
    @kosmine_stotis.should respond_to(:pavadinimas)
  end
  
  it "should have atstumas" do
    @kosmine_stotis.should respond_to(:atstumas)
  end

  it "should have vietos" do
    @kosmine_stotis.should respond_to(:vietos)
  end

  it "should have unique id" do
    @kosmine_stotis.should respond_to(:id)
    stotis = Kosmine_stotis.new('space station', 1234, 20)
    @kosmine_stotis.id.should_not == stotis.id
  end


end

