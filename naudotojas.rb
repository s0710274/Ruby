require 'kosmonautas'
require 'kosmine_stotis'
require 'erdvelaivis'
require 'centras'


class Naudotojas
  def initialize()
    @kosmonautai = []
    @centrai = []
    @erdvelaiviai = []
    @stotys = []
  end

  attr_accessor :kosmonautai, :stotys, :centrai, :erdvelaiviai
  
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
  
  def isodinti_kosmonauta(k_id, e_id)
    if @kosmonautai[k_id].bukle > 70
      #reikia patikrinti ar yra toks laivas ir kosmonautas
      #ziuri ar kosmonautas nera ilipes i kita laiva
      @erdvelaiviai.each do |laivas|
      if laivas != nil
        if laivas.keleiviai.include?(k_id)
          raise "kosmonautas jau ilipes i kita laiva"
          return  #jei kosmonautas jau kitam laive
          end
        end
      end
      #ar telpa kosmonautas i laiva
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
    #nebaigta, kai islaipinam i stoti reikia patikrinti ar yra laisvu vietu
    @erdvelaiviai.each do |laivas|
      if laivas != nil
        if laivas.keleiviai.include?(k_id)
          @erdvelaiviai[laivas.id].keleiviai.delete(k_id)
          if @erdvelaiviai[laivas.id].busena == 'Zeme'
            @kosmonautai[k_id].vieta = 'Zeme'
          elsif @erdvelaiviai[laivas.id].busena == 'Stotis'
            @kosmonautai[k_id].vieta = 'Stotis'
          end
          return  #kai suradom kuri kosmonauta islaipinti, tai iseinam
        end
      end
    end
    raise "kosmonautas nera ilipes i joki laiva"
  end

  def paleisti_laiva(e_id, s_id, kuras)
    if @erdvelaiviai[e_id].keleiviai.empty?      
      raise "Norima paleisti tuscia laiva"
      return
    end
    atstumas = @stotys[s_id].atstumas
    if @erdvelaiviai[e_id].busena == 'Zeme'
      tikslas = 'Stotis'
    else
      tikslas = 'Zeme'
      #parskridus namo turi pavargti
    end
    @erdvelaiviai[e_id].skristi(atstumas, kuras, tikslas)
    if erdvelaiviai[e_id].busena == 'Nukrites'
      @erdvelaiviai[e_id].keleiviai.each do |keleivis|
        if keleivis != nil
          @kosmonautai[keleivis].vieta = 'Zuves'
        end
      end
      raise "erdvelaivis nukrito ir kosmonautai zuvo"
    end
    
    

    
  end
  



end