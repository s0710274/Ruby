require 'kosmonautas'
require 'kosmine_stotis'
require 'erdvelaivis'
require 'centras'
require 'skrydis'


class Naudotojas
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

  def isodinti_kosmonauta(k_id, e_id)
    if @kosmonautai[k_id].bukle > 70
      if @erdvelaiviai[e_id].keleiviai.length < @erdvelaiviai[e_id].vietos
        @erdvelaiviai[e_id].keleiviai.push(k_id)
        @kosmonautai[k_id].vieta = 'Erdvelaivis'
      else
        raise "kosmonautas netelpa i laiva"
      end
    else
      raise "kosmonautas negali skristi"
    end
  end
  
  def islaipinti_kosmonauta(k_id)
    @erdvelaiviai.each do |laivas|
      if laivas != nil
        if laivas.keleiviai.include?(k_id)
          @erdvelaiviai[laivas.id].keleiviai.delete(k_id)
          if @erdvelaiviai[laivas.id].busena == 'Zeme'
            @kosmonautai[k_id].vieta = 'Zeme'
          elsif @erdvelaiviai[laivas.id].busena == 'Stotis'#sitas nepadengtas
            @kosmonautai[k_id].vieta = 'Stotis'
          end
          return  #kai suradom kuri kosmonauta islaipinti, tai iseinam
        end
      end
    end
    raise "kosmonautas nera ilipes i joki laiva"
  end

end