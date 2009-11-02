class Kosmine_stotis
  def initialize(pavadinimas, atstumas, vietos)
    @pavadinimas = pavadinimas
    @atstumas = atstumas
    @vietos = vietos
    @id = (@@id_counter += 1)
  end
  
  attr_reader :pavadinimas, :atstumas, :vietos, :id
  @@id_counter = 0


end