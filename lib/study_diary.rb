require_relative 'study_item'
require_relative 'category'

CADASTRAR = 1
VER_TUDO = 2
CATEGORIA = 3
BUSCAR = 4
APAGAR = 5
SAIR = 6

categorias = [ Category.new('Ruby'),
  Category.new('HTML/CSS'),
  Category.new('JavaScript'),
  Category.new('Rust'),

  ]

def bem_vindo()
  puts "Bem vindo ao seu diário de estudos, o que deseja fazer:"
  puts
end

def menu()
  puts "########## MENU ##########"
  puts "[#{CADASTRAR}] Cadastrar um item para estudar"
  puts "[#{VER_TUDO}] Ver todos os itens cadastrados"
  puts "[#{CATEGORIA}] Listar por categoria"
  puts "[#{BUSCAR}] Buscar um item de estudo"
  puts "[#{APAGAR}] Apagar um item de estudo"
  puts "[#{SAIR}] Sair"
  print "Escolha uma opção: "

end

def mostrar_categorias(categorias)
  categorias.each_with_index{ |catg, ind|
    puts "##{ind + 1} #{catg}"
  }
end

system('clear')
bem_vindo()
menu()
option = gets.to_i()


while option != SAIR
  if option == CADASTRAR
    print "Digite o nome do tópico para estudo: "
    nome = gets.chomp
    mostrar_categorias(categorias)
    print "Escolha uma categoria: "
    cat = gets.to_i
    categoria = categorias[cat - 1]
    puts "Digite uma descrição para o tópico: "
    descr = gets.chomp
    novo_topico = StudyItem.new(nome: nome , categoria: categoria, descr: descr)
    novo_topico.save_to_db
    puts "Item salvo com sucesso!"

  elsif option == VER_TUDO
    system('clear')
    puts "########## LISTA DE ITENS ##########"
    puts StudyItem.all

  elsif option == CATEGORIA
    mostrar_categorias(categorias)
    print "Escolha uma categoria: "
    cat = gets.to_i
    puts StudyItem.list_cat(categorias[cat - 1])
    
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

  puts"\nPressione enter para continuar..."
  gets
  system('clear')
  menu()
  option = gets.to_i()

end