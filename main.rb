require 'naudotojas'
require 'kosmonautas'
require 'kosmine_stotis'
require 'erdvelaivis'
require 'centras'

class Main


def initialize
  @user = Naudotojas.new()
  @kosmo_file = "kosmonautai.data"
  @laivai_file = "erdvelaiviai.data"
  @centrai_file = "centrai.data"
  @stotys_file = "stotys.data"
end


def start
  puts "Sveiki atvyke\n" +
         "pasirinkite komanda:\n" +
         "1 - duomenu administravimas\n" +
         "2 - valdymas\n" +
         "3 - perziureti irasus\n" +
         "exit - darbo pabaiga"
    komanda = gets.chomp
    puts "-" * 50
    if komanda == '1'
      duomenu_administravimas
    elsif komanda == '2'
      valdymas
    elsif komanda == '3'
      info
      start
    elsif komanda == 'exit'
      puts "Programa baige darba"
    else
      puts "tokios komandos nera"
      start
    end
    
end

def duomenu_administravimas
  puts "Pasirinkite komanda:\n" +
       "1 - load duomenys\n" +
       "2 - save duomenys\n" +
       "3 - sukurti objektus\n" +
       "4 - salinti objektus\n" +
       "5 - grizti i pradimi meniu\n" +
       "exit - darbo pabaiga"
  komanda = gets.chomp
  puts "-" * 50
  if komanda == '1'
      load_duomenys
    elsif komanda == '2'
      save_duomenys
    elsif komanda == '3'
      sukurti_objektus
    elsif komanda == '4'
      salinti_objektus
    elsif komanda == '5'
      start
    elsif komanda == 'exit'
      puts "Programa baige darba"
    else
      puts "tokios komandos nera"
      duomenu_administravimas
    end
end

def sukurti_objektus
  puts "Pasirinkite komanda:\n" +
       "1 - sukurti sveikatos centra\n" +
       "2 - sukurti erdvelaivi\n" +
       "3 - sukurti kosmine stoti\n" +
       "4 - sukurti kosmonauta\n" +
       "5 - grizti i pradimi meniu\n" +
       "exit - darbo pabaiga"
  komanda = gets.chomp
  puts "-" * 50
  if komanda == '1'
      puts "Iveskite pavadinima"
      name = gets.chomp
      puts "Iveskite vietu skaiciu"
      vietos = gets.chomp
      vietos = vietos.to_i
      centras = Centras.new(name, vietos)
      @user.add_centras(centras)
      sukurti_objektus  #griztam i buvusi meniu
    elsif komanda == '2'
      puts "Iveskite modeli"
      modelis = gets.chomp
      puts "Iveskite pagaminimo data"
      pagam_data = gets.chomp
      puts "Iveskite vietu skaiciu"
      vietos = gets.chomp
      vietos = vietos.to_i
      puts "Iveskite greiti"
      greitis = gets.chomp
      greitis = greitis.to_i
      puts "Iveskite kuro sanaudas"
      kuro_sanaudos = gets.chomp
      kuro_sanaudos = kuro_sanaudos.to_i
      laivas = Erdvelaivis.new(modelis, pagam_data, vietos, greitis, kuro_sanaudos)
      @user.add_erdvelaivis(laivas)
      sukurti_objektus
    elsif komanda == '3'
      puts "Iveskite pavadinima"
      name = gets.chomp
      puts "Iveskite atstuma"
      atstumas = gets.chomp
      atstumas = atstumas.to_i
      puts "Iveskite vietu skaiciu"
      vietos = gets.chomp
      vietos = vietos.to_i
      stotis = Kosmine_stotis.new(name, atstumas, vietos)
      @user.add_stotis(stotis)
      sukurti_objektus
    elsif komanda == '4'
      puts "Iveskite varda"
      vardas = gets.chomp
      puts "Iveskite pavarde"
      pavarde = gets.chomp
      puts "Iveskite gimimo data"
      gim_data = gets.chomp
      puts "Iveskite lyti"
      lytis = gets.chomp
      puts "Iveskite bukle"
      bukle = gets.chomp
      bukle = bukle.to_i
      kosmonautas = Kosmonautas.new(vardas, pavarde, gim_data, lytis, bukle)
      @user.add_kosmonautas(kosmonautas)
      sukurti_objektus
    elsif komanda == '5'
      start
    elsif komanda == 'exit'
     puts "Programa baige darba"
    else
      puts "tokios komandos nera"
      sukurti_objektus
    end  
end

def salinti_objektus
  puts "Pasirinkite komanda:\n" +
       "1 - Pasalinti sveikatos centra\n" +
       "2 - Pasalinti erdvelaivi\n" +
       "3 - Pasalinti kosmine stoti\n" +
       "4 - Pasalinti kosmonauta\n" +
       "5 - grizti i pradimi meniu\n" +
       "exit - darbo pabaiga"
  komanda = gets.chomp
  puts "-" * 50
  if komanda == '1'
      puts "Iveskite sveikatos centro id"
      id = gets.chomp
      id = id.to_i
      @user.istrinti_centra(@user.centrai[id])
      salinti_objektus
    elsif komanda == '2'
      puts "Iveskite erdvelaivio id"
      id = gets.chomp
      id = id.to_i
      @user.istrinti_erdvelaivi(@user.erdvelaiviai[id])
      salinti_objektus
    elsif komanda == '3'
      puts "Iveskite kosmines stoties id"
      id = gets.chomp
      id = id.to_i
      @user.istrinti_stoti(@user.stotys[id])
      salinti_objektus
    elsif komanda == '4'
      puts "Iveskite kosmonauto id"
      id = gets.chomp
      id = id.to_i
      @user.kosmonauta(@user.kosmonautai[id])
      salinti_objektus
    elsif komanda == '5'
      start
    elsif komanda == 'exit'
      puts "Programa baige darba"
    else
      puts "tokios komandos nera"
      salinti_objektus
    end
end

def valdymas
  puts "Pasirinkite komanda:\n" +
       "1 - ilaipinti kosmonauta\n" +
       "2 - islaipinti kosmonauta\n" +
       "3 - paleisti laiva\n" +
       "4 - grizti i pradimi meniu\n" +
       "exit - darbo pabaiga"
  komanda = gets.chomp
  puts "-" * 50
  if komanda == '1'
      puts "Iveskite kosmonauto id"
      k_id = gets.chomp
      k_id = k_id.to_i
      puts "Iveskite erdvelaivio id"
      e_id = gets.chomp
      e_id = e_id.to_i
      begin
        @user.isodinti_kosmonauta(k_id, e_id)
        rescue => e
        puts e
      end
      valdymas
    elsif komanda == '2'
      puts "Iveskite kosmonauto id"
      k_id = gets.chomp
      k_id = k_id.to_i
      begin
        @user.islaipinti_kosmonauta(k_id)
        rescue => e
        puts e
      end
      valdymas
    elsif komanda == '3'
      puts "Iveskite erdvelaivio id"
      e_id = gets.chomp
      e_id = e_id.to_i
      puts "Iveskite stoties id"
      s_id = gets.chomp
      s_id = s_id.to_i
      puts "Iveskite kiek yra ipilta kuro"
      kuras = gets.chomp
      kuras = kuras.to_i
      begin
        @user.paleisti_laiva(e_id, s_id, kuras)
        rescue => e
        puts e
      end
      valdymas
    elsif komanda == '4'
      start
    elsif komanda == 'exit'
      puts "Programa baige darba"
    else
      puts "tokios komandos nera"
      valdymas
    end  
end

def info
  puts '-' * 50
  puts "Kosmonautai: "
  @user.kosmonautai.each do |kosmonautas|
    if kosmonautas != nil
      puts "Vardas: " + kosmonautas.vardas + " ID: " + kosmonautas.id.to_s +
      " vieta: " + kosmonautas.vieta + " bukle: " + kosmonautas.bukle.to_s
    end
  end
  puts '-' * 50
  puts "Erdvelaiviai: "
  @user.erdvelaiviai.each do |laivas|
    if laivas != nil
      puts "Modelis: " + laivas.modelis + " ID: " + laivas.id.to_s +
      " busena: " + laivas.busena + " kuro sanaudos: " + laivas.kuro_sanaudos.to_s
      s = ""
      laivas.keleiviai.each do |keleivis|
        if keleivis != nil
          s = s + " " + keleivis.to_s
        end
      end
      puts "Laivo keleiviu id sarasas: " + s
    end
  end
  puts '-' * 50
  puts "Centrai: "
  @user.centrai.each do |centras|
    if centras != nil
      puts "Pavadinimas: " + centras.pavadinimas + " ID: " + centras.id.to_s
    end
  end
  puts '-' * 50
  puts "Stotys: "
  @user.stotys.each do |stotis|
    if stotis != nil
      puts "Pavadinimas: " + stotis.pavadinimas + " ID: " + stotis.id.to_s +
        " atstumas: " + stotis.atstumas.to_s + " vietos: " + stotis.vietos.to_s
    end
  end
  puts "-" * 50

end







#########################################################################
  private

 # reikia sutvarkyti objektu id
  

  def load_duomenys
    load_kosmonautai
    load_laivai
    load_centrai
    load_stotys
    start
  end

  def save_duomenys
    save_kosmonautai
    save_laivai
    save_centrai
    save_stotys
    start
  end

  def load_kosmonautai
    if File.exists? @kosmo_file
      f = File.open(@kosmo_file, 'r')
      d = f.read(File.size(@kosmo_file))
      @user.kosmonautai = Marshal.load(d)
      f.close
    end
  end

  def save_kosmonautai
    f = File.new(@kosmo_file, 'w')
    d = Marshal.dump(@user.kosmonautai)
    f.write(d)
    f.close
  end

  def load_laivai
    if File.exists? @laivai_file
      f = File.open(@laivai_file, 'r')
      d = f.read(File.size(@laivai_file))
      @user.erdvelaiviai = Marshal.load(d)
      f.close
    end
  end

  def save_laivai
    f = File.new(@laivai_file, 'w')
    d = Marshal.dump(@user.erdvelaiviai)
    f.write(d)
    f.close
  end

  def load_centrai
    if File.exists? @centrai_file
      f = File.open(@centrai_file, 'r')
      d = f.read(File.size(@centrai_file))
      @user.centrai = Marshal.load(d)
      f.close
    end
  end

  def save_centrai
    f = File.new(@centrai_file, 'w')
    d = Marshal.dump(@user.centrai)
    f.write(d)
    f.close
  end

  def load_stotys
    if File.exists? @stotys_file
      f = File.open(@stotys_file, 'r')
      d = f.read(File.size(@stotys_file))
      @user.stotys = Marshal.load(d)
      f.close
    end
  end

  def save_stotys
    f = File.new(@stotys_file, 'w')
    d = Marshal.dump(@user.stotys)
    f.write(d)
    f.close
  end

end


main = Main.new
main.start