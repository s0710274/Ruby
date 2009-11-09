class Centras
  def initialize(pavadinimas, vietos)
    @pavadinimas = pavadinimas
    @vietu_sk = vietos
    @ligoniu_sk = 0
    @id = (@@id_counter += 1)
  end


  attr_reader :pavadinimas, :vietu_sk, :ligoniu_sk, :id
  @@id_counter = 0
end