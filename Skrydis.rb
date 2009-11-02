class Skrydis
  def initialize
    @id = (@@id_counter += 1)
  end

  
  attr_reader :isvykimo_data, :isvykimo_laikas, :nusileidimo_data, :nusileidimo_laikas
  attr_reader :isvykimo_vieta, :nusileidimo_vieta, :plan_trukme
  attr_reader :id
  @@id_counter = 0

  def nauja_isvykimo_data(data)
    @isvykimo_data = data
  end

  def naujas_isvykimo_laikas(laikas)
    @isvykimo_laikas = laikas
  end

  def nauja_nusileidimo_data(data)
    @nusileidimo_data = data
  end

  def naujas_nusileidimo_laikas(laikas)
    @nusileidimo_laikas = laikas
  end
  
  def naujas_isvykimas()
    puts "Iveskite nauja isvykimo data"
    data = gets.chomp
    nauja_isvykimo_data(data)
    puts "Iveskite nauja isvykimo laika"
    laikas = gets.chomp
    naujas_isvykimo_laikas(laikas)
  end

  def naujas_nusileidimas()
    puts "Iveskite nauja nusileidimo data"
    data = gets.chomp
    nauja_nusileidimo_data(data)
    puts "Iveskite nauja nusileidimo laika"
    laikas = gets.chomp
    naujas_nusileidimo_laikas(laikas)
  end
  
  
  
  
  


end