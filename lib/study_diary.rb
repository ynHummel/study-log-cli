require 'io/console'

require_relative 'study_item'
require_relative 'category'

CADASTRAR = 1
VER_TUDO = 2
CATEGORIA = 3
BUSCAR = 4
APAGAR = 5
SAIR = 6

categories = [ Category.new('Ruby'),
  Category.new('HTML/CSS'),
  Category.new('JavaScript'),
  Category.new('Rust'), 
]

def wait_keypress
  puts "\nPressione qualquer tecla para continuar"
  STDIN.getch
end

def menu()
  puts <<~MENU
    # MENU: 
    [#{CADASTRAR}] Cadastrar um item para estudar
    [#{VER_TUDO}] Ver todos os itens cadastrados
    [#{CATEGORIA}] Listar por categoria
    [#{BUSCAR}] Buscar um item de estudo
    [#{APAGAR}] Apagar um item de estudo
    [#{SAIR}] Sair
    MENU

  print "Escolha uma opção: " 
  gets.to_i()
end

def show_categories(categories)
  categories.each_with_index{ |catg, ind|
    puts "##{ind + 1} #{catg}"
  }
end

system('clear')
puts "Bem vindo ao seu diário de estudos, o que deseja fazer: \n\n"
option = menu()

while option != SAIR
  if option == CADASTRAR
    print "Digite o nome do tópico para estudo: "
    nome = gets.chomp
    show_categories(categories)
    print "Escolha uma categoria: "
    cat = gets.to_i
    categoria = categories[cat - 1]
    puts "Digite uma descrição para o tópico: "
    descr = gets.chomp
    novo_topico = StudyItem.new(nome: nome , categoria: categoria, descr: descr)
    novo_topico.save_to_db
    puts "Item salvo com sucesso!"

  elsif option == VER_TUDO
    system('clear')
    puts "# ITENS"
    puts StudyItem.all

  elsif option == CATEGORIA
    show_categories(categories)
    print "Escolha uma categoria: "
    cat = gets.to_i
    puts StudyItem.list_cat(categories[cat - 1])
    
  elsif option == BUSCAR
    print "Digite uma substring para a busca: "
    sub_str = gets.chomp
    puts StudyItem.find_db(sub_str)

  elsif option == APAGAR
    puts "########## LISTA DE ITENS ##########"
    puts StudyItem.all
    print "Digite o nome do que deseja apagar: "
    title = gets.chomp
    StudyItem.del_from_db(title)

  else
    puts "Comando Inválido"
    
  end

  wait_keypress()
  system('clear')
  option = menu()

end