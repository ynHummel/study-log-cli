class StudyItem
  attr_accessor :nome, :categoria

  def initialize(nome, categoria)
    @nome = nome
    @categoria = categoria
  end

  def to_s
    "#{self.nome} - #{self.categoria.nome}"
  end

end