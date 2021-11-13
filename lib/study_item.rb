class StudyItem
  attr_accessor :nome, :categoria, :descricao, :state

  def initialize(nome, categoria, descricao, state: false)
    @nome = nome
    @categoria = categoria
    @descricao = descricao
    @state = state
  end

  def to_s
    "##{self.categoria.nome} - #{self.nome}:  #{self.descricao}"
  end

end

# require_relative 'lib/study_item'
# require_relative 'lib/category'
# teste = StudyItem.new('teste', Category.new('cat'), 'testestestse')