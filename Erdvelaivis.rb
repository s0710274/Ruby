class Erdvelaivis
  def initialize(modelis, pagam_data, vietos, greitis)
    @modelis = modelis
    @pagaminimo_data = pagam_data
    @vietos = vietos
    @greitis = greitis
    @busena = 'Zeme'  #Zeme|Kosmosas|Stotis|Else
    @id = (@@id_counter += 1)
    @keleiviai = [] #saugom kosmonautu id
  end
  attr_reader :modelis, :pagaminimo_data, :vietos, :greitis, :id
  attr_accessor :keleiviai, :busena
  @@id_counter = 0

end