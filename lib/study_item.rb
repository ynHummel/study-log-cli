require 'sqlite3'

require_relative 'category'

class StudyItem
  attr_accessor :nome, :categoria, :descr

  def initialize(nome:, categoria:, descr:, done: false)
    @nome = nome
    @categoria = categoria
    @descr = descr
    @done = done
  end

  def to_s
    "* #{self.nome} - #{self.categoria}:  #{self.descr}"
  end

  def self.register
    print "Digite o nome do tópico para estudo: "
    nome = gets.chomp
    puts Category.all
    print "Escolha uma categoria: "
    cat = gets.to_i
    categoria = Category.index(cat).title
    puts "Digite uma descrição para o tópico: "
    descr = gets.chomp
    novo_topico = StudyItem.new(nome: nome , categoria: categoria, descr: descr)
    db = SQLite3::Database.open "db/database.db"
    db.execute "INSERT INTO Estudo VALUES('#{ novo_topico.nome }', '#{ novo_topico.categoria }', '#{ novo_topico.descr }')"
    db.close
    puts "Item salvo com sucesso!"
  end

  def self.all
    db = SQLite3::Database.open "db/database.db"
    db.results_as_hash = true
    topicos = db.execute "SELECT title, category, descr FROM Estudo"
    db.close
    topicos.map { |topico| new(nome: topico['title'], categoria: topico['category'], descr: topico['descr']) }
  end

  # def save_to_db
  #   db = SQLite3::Database.open "db/database.db"
  #   db.execute "INSERT INTO Estudo VALUES('#{ nome }', '#{ categoria }', '#{ descr }')"
  #   db.close
  #   self
  # end

  def self.del_from_db(title)
    db = SQLite3::Database.open "db/database.db"
    db.execute "DELETE FROM Estudo WHERE title = '#{title}'";
    db.close
  end

  def self.find_db(termo)
    db = SQLite3::Database.open "db/database.db"
    db.results_as_hash = true
    topicos = db.execute "SELECT title, category, descr FROM Estudo where title LIKE '%#{termo}%' OR descr LIKE '%#{termo}%'"
    db.close
    topicos.map { |topico| new(nome: topico['title'], categoria: topico['category'], descr: topico['descr']) }
  end
  
  def self.list_cat(cat)
    db = SQLite3::Database.open "db/database.db"
    db.results_as_hash = true
    topicos = db.execute "SELECT title, category, descr FROM Estudo where category ='#{cat}'"
    db.close
    topicos.map { |topico| new(nome: topico['title'], categoria: topico['category'], descr: topico['descr']) }
  end


end

# require_relative 'lib/study_item'
# require_relative 'lib/category'
# teste = StudyItem.new('teste', Category.new('cat'), 'testestestse')