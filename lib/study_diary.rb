require_relative 'study_item'
require_relative 'category'

CADASTRAR = 1
VER_TUDO = 2
BUSCAR = 3
SAIR = 4

categorias = [ Category.new('Ruby'),
  Category.new('HTML/CSS'),
  Category.new('JavaScript'),
  Category.new('Rust')
  ]

itens = []

def bem_vindo()
  puts "Bem vindo ao seu diário de estudos, o que deseja fazer:"
  puts
end

def menu()
  puts "### MENU ###"
  puts "[#{CADASTRAR}] Cadastrar um item para estudar"
  puts "[#{VER_TUDO}] Ver todos os itens cadastrados"
  puts "[#{BUSCAR}] Buscar um item de estudo"
  puts "[#{SAIR}] Sair"
  print "Escolha uma opção: "
end

def cadastrar_item(itens,categorias)
  print "Digite o título do item de estudo: "
  nome = gets.chomp
  categorias.each_with_index{ |catg, ind|
    puts "#{[ind + 1]} #{catg.nome}"
  }
  print "Selecione uma categoria: "
  cat = gets
  itens << StudyItem.new(nome, categorias[cat.to_i - 1])
  puts "Item cadastrado com sucesso"
end

def todos_itens(lista)
  puts "### LISTA DE ITENS ###"
  lista.each { |item|
    puts "#{item.nome} - #{item.categoria.nome}"
  }
end

def busca_item(lista)
  print "Digite o termo da busca: "
  substring = gets.chomp
  lista.select! { |item|
    item.nome.downcase.include? substring.downcase
  }  
  if lista.length == 0
    puts "Não foram achados itens com o termo pesquisado."
    return
  end
  puts lista
end


system('clear')
bem_vindo()
menu()
option = gets.to_i()

while option != SAIR
  if option == CADASTRAR
    cadastrar_item(itens, categorias)
  elsif option == VER_TUDO
    todos_itens(itens)
  elsif option == BUSCAR
    busca_item(itens)
  else
    puts "Comando Inválido"
  end

  gets
  system('clear')
  menu()
  option = gets.to_i()
end