class Centras
  def initialize(pavadinimas, vietos, ligoniai)
    @pavadinimas = pavadinimas
    @vietu_sk = vietos
    @ligoniu_sk = ligoniai
  end


  attr_reader :pavadinimas, :vietu_sk, :ligoniu_sk
end