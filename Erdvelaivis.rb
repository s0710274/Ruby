class Erdvelaivis
  def initialize(modelis, pagam_data, vietos, greitis)
    @pavadinimas = modelis
    @pagaminimo_data = pagam_data
    @vietos = vietos
    @greitis = greitis
    @busena = 'Zemeje'
  end
  attr_reader :modelis, :pagaminimo_data, :vietos, :greitis
  attr_reader :kosmonautu_sk, :busena


end