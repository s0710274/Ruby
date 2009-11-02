class Erdvelaivis
  def initialize(modelis, pagam_data, vietos, greitis)
    @pavadinimas = modelis
    @pagaminimo_data = pagam_data
    @vietos = vietos
    @greitis = greitis
    @busena = 'Zemeje'
    @id = (@@id_counter += 1)
  end
  attr_reader :modelis, :pagaminimo_data, :vietos, :greitis
  attr_reader :kosmonautu_sk, :busena, :id
  @@id_counter = 0

end