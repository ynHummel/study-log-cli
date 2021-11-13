require_relative 'study_item'
require_relative 'category'

CADASTRAR = 1
VER_TUDO = 2
CATEGORIA = 3
BUSCAR = 4
SAIR = 5

categorias = [ Category.new('Ruby'),
  Category.new('HTML/CSS'),
  Category.new('JavaScript'),
  Category.new('Rust'),

  Category.new('Concluído')
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
  puts "[#{CATEGORIA}] Listar por categoria"
  puts "[#{BUSCAR}] Buscar um item de estudo"
  puts "[#{SAIR}] Sair"
  print "Escolha uma opção: "
end

def mostrar_categorias(categorias)
  system('clear')
  categorias.each_with_index{ |catg, ind|
    puts "##{ind + 1} #{catg}"
  }
end

def cadastrar_item(itens,categorias)
  print "Digite o título do item de estudo: "
  nome = gets.chomp
  mostrar_categorias(categorias)
  print "Selecione uma categoria: "
  cat = gets.to_i
  print "Dê uma descrição breve: "
  desc = gets.chomp
  itens << StudyItem.new(nome, categorias[cat - 1], desc)
  puts "Item cadastrado com sucesso"
  
end

def busca_item(lista)
  print "Digite o termo da busca: "
  substring = gets.chomp
  sel_lista = lista.select { |item|
    item.to_s.downcase.include? substring.downcase
  }  
  if sel_lista.length == 0
    puts "Não foram achados itens com o termo pesquisado."
    return
  end
  puts sel_lista
end

def lista_cat(lista, categorias)
  mostrar_categorias(categorias)
  print "Selecione uma categoria: "
  cat = gets.to_i
  sel_lista = lista.select { |item|
    item.categoria == categorias[cat - 1]
  }
  puts sel_lista
end


system('clear')
bem_vindo()
menu()
option = gets.to_i()

while option != SAIR
  if option == CADASTRAR
    cadastrar_item(itens, categorias)
  elsif option == VER_TUDO
    system('clear')
    puts "### LISTA DE ITENS ###"
    puts itens
  elsif option == CATEGORIA
    lista_cat(itens, categorias)
  elsif option == BUSCAR
    busca_item(itens)
  else
    puts "Comando Inválido"
  end

  puts"Pressione enter para continuar..."
  gets
  system('clear')
  menu()
  option = gets.to_i()
end