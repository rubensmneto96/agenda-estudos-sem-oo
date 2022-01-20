@item_estudo = [{
    item: 'Item de Estudo', categoria: 'Categoria'
}]

def criar_item
    puts 'Digite o item: '
    item = gets.chomp
    puts 'Digite a categoria: '
    categoria = gets.chomp

    if item == '' || categoria == ''
        puts 'Inválido! Tente de novo!'
    else
        @item_estudo << {item: item, categoria: categoria}
        puts 'Item criado!'
        puts "\n"
    end    
end

def mostrar_itens
    @item_estudo.each do |item|
        puts "Item: #{item[:item]} -> Categoria: #{item[:categoria]}"
    end
    puts '-------------------------------------------------------------'
end

def buscar_item
    puts 'Digite o item que queira buscar: '
    item = gets.chomp

    @item_estudo.each do |item_buscar|
        if item_buscar[:item].downcase.include?(item.downcase)
            puts "Item: #{item_buscar[:item]} -> Categoria: #{item_buscar[:categoria]}"
        end
    end
end

def editar_item
    puts 'Digite o item que quer editar: '
    item = gets.chomp

    @item_estudo.each do |item_editar|
        if item_editar[:item].downcase.include?(item.downcase)
            puts 'Item para editar: (Se quiser manter, aperte o Enter.)'
            item_salvo = item_editar[:item]

            item_editar[:item] = gets.chomp
            item_editar[:item] = item_editar[:item].empty? ? item_salvo : item_editar[:item]

            puts 'Categoria para editar: (Se quiser manter, aperte o Enter.)'
            categoria_salvo = item_editar[:categoria]

            item_editar[:categoria] = gets.chomp
            item_editar[:categoria] = item_editar[:categoria].empty? ? categoria_salvo : item_editar[:categoria]
        end
    end
end

def remover_item
    puts 'Digite o item deseja remover: '
    item = gets.chomp

    @item_estudo.each do |item_remover|
        if item_remover[:item].downcase.include?(item.downcase)
            indice = @item_estudo.index(item_remover)
            @item_estudo.delete_at(indice)
            break
        end
    end
end

# Menu

loop do
    puts 'Diário de estudos'
    puts '[1] Criar item de estudo'
    puts '[2] Visualizar todos os items de estudos'
    puts '[3] Buscar um item de estudo'
    puts '[4] Editar item'
    puts '[5] Remover item'
    puts '[0] Sair'
    puts 'Escolha uma opção:'
    opcao = gets.to_i

    case
    when opcao == 1
        criar_item
    when opcao == 2
        mostrar_itens
    when opcao == 3
        buscar_item
    when opcao == 4
        editar_item
    when opcao == 5
        remover_item
    when opcao == 0
        puts 'Saindo...'
        break
    end
end