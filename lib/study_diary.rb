class Main
  def self.menu()
    # system('clear')
    puts "\n[1] Cadastrar um item para estudar"
    puts "[2] Ver todos os itens cadastrados"
    puts "[3] Buscar um item de estudo"
    puts "[4] Sair"
    print "\nEscolha uma opção: "
  end

  menu()
  itens = []

  opcao = gets.to_i()
  
  while opcao != 4
    if opcao == 1
      print "Digite o nome do item para estudo: "
      itens << gets
      print "Digite "
    elsif opcao == 2 
      itens.each_with_index do |item, ind|
        puts "#{ind} - #{item}"
      end
    elsif opcao == 3
      puts 3
    else
      puts "Comando inválido"
    end
    menu()
    opcao = gets.to_i()
  end
  
  puts "Obrigado por usar o programa"
end