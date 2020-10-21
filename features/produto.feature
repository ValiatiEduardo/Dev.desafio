#idioma :pt

Funcionalidade: Gerenciar Ofertas combo
    Para que eu possa gerenciar as ofertas 
    Sendo um gestor 
    Para que o cliente possa visualizar o preço promocional mediante a inclusam do combo no carrinho entre outras informações.

    Contexto: Uma mensagem de erro deve ser retornada  e a ofeta não é criada

        Dado que o cliente esteja escolhendo produtos no site
        Quando o cliente escolhe um produto 
        E o site oferece um combo de produtos <nome> com <listaDeProdutos>
        E cliente seleciona <nome>
        Quando confirmar a compra
        E algum outro produto de <nome> não estiver associado a um <centroDeDistribuição>.
        Então o site deve retornar uma mensagem de erro ' resultado '

    Contexto: A oferta criada com sucesso

        Dado que o cliente esteja ecolhendo produtos no site
        Quando o cliente escolhe um produto
        E o site sugere um combo de produtos <nome> com <listaDeProdutos>
        E cliente seleciona <nome>
        E todas as propriedades de combo forem aceitas
        Quando o cliente finalizar a compra no carrinho
        Então o site deve retornar uma mensagem  como "resultado"
            Examples:
         | nome               | listaDeProdutos                |  centroDistribuição  | resultado                    |
         |   combo limpeza    |    detergente, água sanitária  |     não existe       |      mensagem de  erro       |
         |   combo alimento'  |   massa, pão, farinha          |       Cd1            |     <preço_promocional>      |

   Contexto: Quantidade de produtos no combo seperior ao limite oferta descartada
        
        Dado que o cliente esteja ecolhendo produtos no site
         E o site sugere um <nome> e a <listaDeProdutos>
        Quando o cliente quiser editar um <nome> ou <listaDeProdutos>
        E o cliente editar uma <listaDeProdutos> com número de produtos maior do que 4 produtos
        Quando confirmar a compra
        Então deve ser retornada uma mensagem de erro 'resultado'
   
    Contexto: Quantidade de produtos no combo
        
        Dado que o cliente esteja ecolhendo produtos no site
        E o site sugere um combo de produtos <nome> com <listaDeProdutos>
        Quando o cliente quiser editar um <nome> ou <listaDeProdutos>
        E o cliente editar uma <listaDeProdutos> com número de produtos menor ou iqual a 4 produtos
        E todos propriedades do combo forem aceitas
        Quando confirmar a compra
        Então o site deve retornar uma mensagem como 'resultado'
        Examples:
        | nome                   | código  |  Quantidade | listaDeProdutos  | codigo após ser editada | listaDeProdutos_editada | Quantidade após ser editada  |  resultado                 |                              |
        | combo padaria          | 10023   |  1          | pão              |  10023                  |   pão                   | 2                            | 'Quantidade de produtos    |
        |                        | 10024   |  1          | biscoito         |  10045                  |   doce                  | 2                            | excedeu o limite           |
j        |                        | 10025   |  2          | queijo           |  10025                  |   queijo                | 3                            | de produtos em 3 unidades' |
        
        | nome                  | código   | Quantidade  | listaDeProdutos | código após editado| listaDeProdutos_editada | Quantidade após ser editada | resultado        |
        | combo açougue         | 10058    |   2         |  saco de carvão |10058               |   saco de carvão        |  2                          |   Oferta criada  |                       |
        |                       | 10059    |   1         | sal grosso      | 10059              |   sal grosso            |  1                          |   com sucesso    |                     |
        |                       | 10060    |   1         | espeto          | 10027              |   carne                 |  1                          |                  | 
   
   Contexto: Produto não encontado no estoque
       
        Dado que o cliente esteja escolhendo produtos no site
        Quando escolher um produto
        E o site sugere ao cliente um combo de produtos <nome> com <listaDeProdutos>
        E o cliente selecionar <nome> 
        Quando confirmar 
        E algum produto do combo assuma valor em estoque <produto =< 0> a oferta é cancelada
        Então deve retornar uma mensagem de erro como "Produto não encontrado no estoque"
         Examples:
        |       nome       |  Código    | listaDeProdutos  |   estoque  | resultado |
        |                  |    1000105 |      queijo      |       1    |    true   |
        |Combo de alimentos|    1000106 |       ovos       |       0    |    false  |
        |                  |    1000107 |       massa      |       1    |    true   |
        |                  |    1000108 |       farinha    |       1    |    true   |
             
    Contexto: No caso de ofertas duplas 
       
       Dado que o cliente esteja escolhendo produtos no site
       Quando escolher um produto
       E o site oferecer ao cliente um combo de produtos <nome> com <listaDeProdutos>
       E o cliente seleciona <nome>
       Quando o cliente confirmar
       E algum produto esteja em oferta no periodo coincidente com o periodo de criação ou alteração do combo a oferta é cancelada  
       Então deve retornar uma mensagem de erro 'Produto já está em oferta !'
       Examples:
           | nome            | listaDeProdutos                | oferta avulsa | data_criação oferta combo | data_final oferta combo  | data_criação  oferta avulsa   / data_final oferta avulsa       | resultado  |
           | Combo de igiene | escova, creme dental, sabonte  | sabonete      | 23/07/2020  15:32         |  03/08/2020 17:00        | 20/07/2020 11:48              /  25/07/2020  12:00             |     null   |
:
    Contexto: Alterar e editar oferta combo
        
        Dado que o cliente esteja escolhendo produtos no site
        Quando selecionar um produto
        E o site oferecer ao cliente um combo de produtos <nome> com <listaDeProdutos> mas o cliente deseja alterar, adicionar ou excluir algum produto do combo 
        E o cliente seleciona <nome> para alteração da <listaDeProdutos>
        E se todas as propriedades do combo forem aceitas
        Quando o cliente confirma
        Então uma nova <listaDeProdutos> será criada para o <nome>
        Examples:
            | nome              | listaDeProdutos                               | nova listaDeProdutos                       | 
            | combo de doces    |  balas, chocolate, caixa de bombons           | chocolate, caixa de bombons, refrigerante  |

 
   
        
 



