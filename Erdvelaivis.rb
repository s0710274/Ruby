class Erdvelaivis
  def initialize(modelis, pagam_data, vietos, greitis)
    @pavadinimas = modelis
    @pagaminimo_data = pagam_data
    @vietos = vietos
    @greitis = greitis
  end
  attr_reader :modelis, :pagaminimo_data, :vietos, :greitis


end