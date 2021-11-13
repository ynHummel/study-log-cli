class Category
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end

  def to_s
    "#{self.nome}"
  end

end