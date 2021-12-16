require 'io/console'

require_relative 'study_item'
require_relative 'category'

CADASTRAR = 1
VER_TUDO = 2
CATEGORIA = 3
BUSCAR = 4
APAGAR = 5
SAIR = 6

def wait_keypress()
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

system('clear')
puts "Bem vindo ao seu diário de estudos, o que deseja fazer: \n\n"
option = menu()

loop do
  if option == CADASTRAR
    StudyItem.register

  elsif option == VER_TUDO
    system('clear')
    puts "# ITENS"
    puts StudyItem.all

  elsif option == CATEGORIA
    puts Category.all
    print "Escolha uma categoria: "
    cat = gets.to_i
    puts StudyItem.list_cat(Category.index(cat))  #Não funciona
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
  elsif option == SAIR
    break
  else
    puts "Comando Inválido"
end

  wait_keypress()
  system('clear')
  option = menu()

end