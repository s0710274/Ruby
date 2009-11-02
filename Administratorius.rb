require 'kosmonautas'
require 'kosmine_stotis'
require 'erdvelaivis'
require 'centras'
require 'skrydis'


class Administratorius
  def initialize()
    @kosmonautai = []
    @centrai = []
    @erdvelaiviai = []
    @stotys = []
    @skrydziai = []
  end

  attr_accessor :kosmonautai, :stotys, :centrai, :erdvelaiviai, :skrydziai
  
  def add_kosmonautas(kosmonautas)
    @kosmonautai[kosmonautas.id] = kosmonautas
  end

  def add_centras(centras)
    @centrai[centras.id] = centras
  end

  def add_erdvelaivis(laivas)
     @erdvelaiviai[laivas.id] = laivas
  end

  def add_stotis(stotis)
    @stotys[stotis.id] = stotis
  end

  def add_skrydis(skrydis)
    @skrydziai[skrydis.id] = skrydis
  end

  def istrinti_centra(centras)
    @centrai[centras.id] = nil
  end

  def istrinti_erdvelaivi(laivas)
    @erdvelaiviai[laivas.id] = nil
  end

  def istrinti_stoti(stotis)
    @stotys[stotis.id] = nil
  end

  def istrinti_kosmonauta(kosmonautas)
    @kosmonautai[kosmonautas.id] = nil
  end

  def istrinti_skrydi(skrydis)
    @skrydziai[skrydis.id] = nil
  end

end