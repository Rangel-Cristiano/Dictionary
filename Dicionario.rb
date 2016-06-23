/Universidade de Caxias do Sul
Aluno: Rangel Cristiano Tonin
Trabalho de Paradigmas/

require 'csv'

dicionario = Hash.new

CSV.foreach('entrada.txt', encoding: "UTF-8") do |linha|
	dicionario[linha[0]] = linha[1]
end

opcao = nil

while opcao != "0" do

	puts "--------------------------------------------------"
	puts "\t Escolha uma das Opções abaixo:"
	puts " 0. Sair"
	puts " 1. Mostrar"
	puts " 2. Incluir"
	puts " 3. Excluir"
	puts " 4. Alterar traduções"
	puts " 5. Pesquisar"
	puts " 6. Importar para novo arquivo CSV"
	puts "--------------------------------------------------"

	opcao = gets.chomp

	case opcao
		when "0"
			puts "\n Programa encerrado !!!\n"

		when "1"
	
		 dicionario.each do |palavra, traducao|
	    	puts palavra + ' : ' + traducao
	     end

		when "2"
		  puts " Informe a palavra em espanhol"
		  palavra = gets.chomp

		  puts " Informe sua respectiva tradução em português"
		  traducao = gets.chomp

		  dicionario[palavra] = traducao

		  puts "\n Inserido com Sucesso\n"

		when "3"
		  puts " Informe a palavra que deseja excluir"
		  palavra = gets.chomp

		  if (dicionario.delete(palavra) != nil) 
			puts "\n Exclusão realizada com sucesso\n"
		   else 
		  	puts "\n Palavra não encontrada\n"
		  end
		  
		when "4"
		  puts " Informe qual palavra do dicionario deseja alterar"
		  palavra = gets.chomp

		  if (dicionario[palavra] != nil)
		  	puts " Informe sua nova traducao"
		  	traducao = gets.chomp

		  	dicionario[palavra] = traducao
		  	puts "\n Tradução editada\n"
		  else 
		  	puts "\n Palavra não encontrada\n"
		  end

		when "5"
		  puts " Informe a inicial da palavra em espanhol que deseja buscar"
		  inicial = gets.chomp

		  achou = false
		  dicionario.each do |palavra, traducao|
		  	if palavra[0] == inicial
		  		achou = true
	    		puts palavra
	    	end
	      end

	      if (achou)
	      	puts "\n Agora informe qual das palavras acima deseja ver a tradução"

			palavra = gets.chomp
			traducao = dicionario[palavra]

			if (traducao != nil) 
				puts " \n Palavra: " + palavra + " Tradução: " + traducao
			else
				puts " \n Essa palavra não foi encontrada"
			end
	      else
	      	puts " \n Nenhuma palavra encontrada com essa inicial"
	      end

		when "6"		
		  File.open('saida.csv', 'w', encoding: "UTF-16") do |row|
			  dicionario.each do |palavra, traducao|
			  	row.puts palavra + ',' + traducao
			  end
		  end

		  puts "\n O arquivo foi gerado com sucesso !!\n"
		else
		  puts "\n Opção inválida !! Tente Novamente"
	end		
end

