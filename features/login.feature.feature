 # language: pt

Funcionalidade: Gerenciar Ofertas combo
    Para que eu possa gerenciar as ofertas de combo
    Sendo um usuário 
    Posso visualizar o preço promocional mediante a inclusam do combo no carrinho

    Cenario: Informar sobre o combo
    
        Dado que eu escolha os produtos da lista
        Quando eu seleciono o limite de 4.0 produtos para formar um combo no carrinho "arroz", "feijão", "cebola" e "cenora"
        Então devo ser informado do valor do 'desconto' e a 'quantidade de produtos'.

    Cenário: excluir produto da lista

        Dado que o cliente adicione um produto ao carrinho e após deseja remove - lo
        Quando o cliente desejar substituir o produto por um outro produto
        Então deve ver uma mensagem 'deseja substituir o produto.'
        
    Cenario: Produto fora da lista
        
        Dado que eu escolha um produto fora da lista
        Quando eu incluo o produto fora da lista no carrinho 
        Então devo ver a mensagem "Este produto não consta na lista de ofertas combo."

    Cenario: Produto em falta no estoque
        
        Dado que eu escolha um produto em falta no estoque
        Quando eu adicionar no carrinho esse produto
        Então devo ver a mensagem "Produto em falta."

    Cenario: Combo com menos do que 4 produtos
       
        Dado que eu escolha 3 ou 2 produto somente
        Quando eu inclua os produtos no carrinho
        Então devo ver a mensagem "O desconto  proporcional a o 'valor' e 'quantidade'  dos produtos."

    Cenario: Desconto duplo
        
        Dado que eu inclua um produto que já estava em oferta no combo de ofertas
        Quando incluo o produto no combo
        Então devo ver a mensagem " Este produto já está em oferta."





