class Erdvelaivis
  def initialize(modelis, pagam_data, vietos)
    @pavadinimas = modelis
    @pagaminimo_data = pagam_data
    @vietos = vietos
  end
  attr_reader :modelis, :pagaminimo_data, :vietos


end