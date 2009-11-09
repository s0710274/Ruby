
class Kosmonautas
  
  def initialize(vardas, pavarde, gim_data, lytis, bukle)
    @vardas = vardas
    @pavarde = pavarde
    @gim_data = gim_data
    @lytis = lytis
    @vieta = 'Else' #Zeme|Erdvelaivis|Stotis|Else|Zuves
    @id = (@@id_counter += 1)
    @bukle = bukle # nurodoma procentais
  end

  attr_accessor :vardas, :pavarde, :gim_data, :lytis, :id, :bukle
  attr_accessor :vieta
  @@id_counter = 0

  def pavargti
    @bukle = @bukle - 10
  end

  
end
