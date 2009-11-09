class Erdvelaivis
  def initialize(modelis, pagam_data, vietos, greitis, kuro_sanaudos)
    @modelis = modelis
    @pagaminimo_data = pagam_data
    @vietos = vietos
    @greitis = greitis
    @busena = 'Zeme'  #Zeme|Kosmosas|Stotis|Else|Nukrites
    @id = (@@id_counter += 1)
    @keleiviai = [] #saugom kosmonautu id
    @kuro_sanaudos = kuro_sanaudos #kuro sanaudos simtui km
  end
  attr_reader :modelis, :pagaminimo_data, :vietos, :greitis, :id
  attr_accessor :keleiviai, :busena, :kuro_sanaudos
  @@id_counter = 0

  def skristi(atstumas, kuras, tikslas)#paduodamas atstumas yra km, o kuras litrai
        reikia_kuro = atstumas / 100.0 * @kuro_sanaudos
    if kuras < reikia_kuro
      @busena = 'Nukrites'
    else
      @busena = tikslas
    end

  end

end