
class Kosmonautas
  
  def initialize(vardas, pavarde, gim_data, lytis)
    @vardas = vardas
    @pavarde = pavarde
    @gim_data = gim_data
    @lytis = lytis
    @vieta = 'Else'
    @id = (@@id_counter += 1)
  end

  attr_reader :vardas, :pavarde, :gim_data, :lytis, :vieta, :id
  @@id_counter = 0
  
  
end
