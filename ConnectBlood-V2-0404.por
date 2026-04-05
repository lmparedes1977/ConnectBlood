// Para o programa ficar mais fluido, vamos utilizar um par de estruturas
// que ainda não foram faladas em aula: Funções e Vetores
// FUNÇÃO:
// Bloco que código reutilizável. Pode ou não receber parâmetros. Quando recebe, ele é usado na função (Exemplo: com parâmetro: soma(2 , 4); sem parâmetro sayHello())
// Função pode ou não retornar valor para o ponto onde a função é chamada (Exemplo: com retorno soma(2 , 4) retorna o resultado de 2 + 4; sem parâmetro: sayHello() apenas escreve "Hello" na tela)
// Tu vai entender olhando as funções que eu criei ali.
// VETORES:
// São listas de valores do mesmo tipo. Exemplo: 'cadeia bancosDeSangue[5]' é uma só variavel que guarda 5 'cadeias' diferentes
// O jeito de gravar e buscar é pela posição. Nesse exemplo, as posições vão de 0 a 4, que dão um totla de 5 posições (0, 1, 2, 3, 4)
// daí cada posição servirá para um dado: [0] = Nome do Banco; [1] = Endereço; [2] = Horário ; [3] = email ; [4] = telefone
// Maaaaas... pra complicar um pouco (na verdade, para o programa ficar mais utilizável) pensei em utilizar vetores de duas dimensões
// Vetor de duas dimensões é um vetor de vetores. Representamos bancos[][],
// onde o primeiro [] representa a posição do vetor interno dentro do vetor externo,
// e o segundo [] a posição do dado dentro do vetor interno.
// Imagine uma matriz 5 X 5...

programa {

  inclua biblioteca Util --> u // Importa a biblioteca Util e dá um apelido 'u' para dar um efeito de processamento (frescura legal)

  // chamada em vários lugares para imprimir o letreiro em tela
  funcao letreiroPrograma() {    
    escreva("#################################################\n")
    escreva("########         CONNECT BLOOD           ########\n")
    escreva("#################################################\n")
  }

  // chamada na abertura do programa e quando voltamos para o menu principal
  funcao menuLogin() {
    letreiroPrograma()  // Estou chamando a função ali de cima. o jeito de chamar uma função é escrever o nome dela com abre-fecha parênteses
    escreva("\n          ###### OPÇÕES DE LOGIN ######\n")
    escreva("          ####  1 - DOADOR         ####\n")
    escreva("          ####  2 - ADMINISTRADOR  ####\n")
    escreva("          ####  3 - SAIR           ####\n")
    escreva("          #############################\n")
  }


    funcao menuDoador() {
    letreiroPrograma()
    escreva("\n        ######## OPÇÕES DE DOADOR ########\n")
    escreva("        ###  1 - AGENDAMENTO           ###\n")
    escreva("        ###  2 - ATUALIZAR CADASTRO    ###\n")
    escreva("        ###  3 - SAIR                  ###\n")
    escreva("        ##################################\n")
    }
  // chamada quando entramos no menu admin e depois de realizarmos as ações 1, 2 ou 3
  funcao menuAdmin() {
    letreiroPrograma() 
    escreva("\n        ###### OPÇÕES ADMINISTRADOR ######\n")
    escreva("        ####  1 - CADASTRAR BANCO     ####\n")
    escreva("        ####  2 - LISTAR BANCOS       ####\n")
    escreva("        ####  3 - LISTAR DOADORES     ####\n")
    escreva("        ####  4 - VOLTAR              ####\n")
    escreva("        ##################################\n")
  }

  funcao alerta(){
    escreva("\n ####################################################################\n")
    escreva(" ###    CARO DOADOR, LEMBRAMOS QUE ESSAS PERGUNTAS DEVEM SER      ###\n")
    escreva(" ###    REPONDIDAS COM SINCERIDADE E RESPONDABILIDADE!            ###\n")
    escreva(" ###    TODAS AS INFORMAÇÕES DEVEM SER VERDADEIRAS, SOB RISCO     ###\n")
    escreva(" ###    DE RESPONSABILIZAÇÃO NOS TERMOS DA LEGISLAÇÃO VIGENTE.    ###")
    escreva("\n ####################################################################\n")
  }

  funcao menuAgendamento() {
    letreiroPrograma()
    escreva("\n        ###### OPÇÕES DE AGENDAMENTO ###############\n")
    escreva("          ####  1 - SELECIONE UM BANCO DE SANGUE #####\n")
    escreva("          ####  2 - DICAS PARA O DIA DA DOAÇÃO   ####\n")
    escreva("          ####  3 - VOLTAR              #####\n")
    escreva("          #################################\n")
  }

  funcao dicas(){
    escreva("\n      ################################################################\n")
    escreva("        ####  1- Leve um documento oficial com foto.              ######\n")
    escreva("        ####  2- Esteja bem alimentado(a), não doe em jejum       ######\n")
    escreva("        ####  3- Use roupas confortávies                         #######\n")
    escreva("        ####  4- Durma pelo menos 6 horas na noite anterior      #######\n")
    escreva("        ####  5- Evite bebidas alcoólicas por 12 horas antes     #######\n")
    escreva("        ####  6- Não fume por pelo menos 2 horas antes           #########")
    escreva("\n      ################################################################\n")
  }



  // função genérica que o código digitado pelo usuário. Recebe como parâmetro o valor máximo do menu que está chamando
  // valida se a opção está dentro dos limites e repete infinitamente até o cara acertar
  funcao inteiro recebeCodigo(inteiro maiorOpcao) {
    inteiro codigo  // podemos declarar variáveis dentro de função elas só existem aqui.
    escreva("\nDigite sua opção: ")
    leia(codigo)
    enquanto(codigo < 1 ou codigo > maiorOpcao) {
      escreva("\n           !!! Código Inválido !!!\n")
      menuLogin()
      escreva("\nDigite sua opção: ")
      leia(codigo)
    }
    retorne codigo  // retorna o valor da variável código, não a variável em si
  }

  // declaração das variáveis globais
  cadeia bancos[5][5]  // o "banco de dados" de bancos de sangue. Estou determinando que serão 5 vetores, cada um com 5 posições
  inteiro proximoBanco = 0  // contador para saber em que posição gravar cada banco de sangue
  inteiro codigoMenuPrincipal // guarda a opção do usuário no menu principal
  inteiro codigoMenuInterno  // guarda a opção do usuário no menu interno, reutilizável tanto para admin quanto para doador
  cadeia dummy // variável 'dummy', só para que o leia() provoque a parada do programa  
 
  
  
  
  funcao inicio() {  // perceba que o início do algoritmo é uma função...
    
    menuLogin()

    codigoMenuPrincipal = recebeCodigo(3)  // Duas coisas: a função recebeCodigo exige passagem de parâmetro (3) ; como ela retorna valor, estou atribuindo o retorno dela à variável codigoMenuPrincipal

    enquanto(codigoMenuPrincipal != 3) {  // enquanto de nível 1. O programa vai viver enquanto o usuári não digitar 3

      escolha(codigoMenuPrincipal) {  // escolha caso de nivel 1. preferi escolha caso ao invés de SE, pois as opções são restritas e achei mais legível
        caso 1:
          //código do menu doador
          limpa()
          menuDoador()
          inteiro codigoMenuDoador=0
          escreva("\nDigite sua opção: ")
          leia(codigoMenuDoador)
          
          escolha(codigoMenuDoador){
            caso(1):
          
            logico impedido=falso
            caracter pre_triagem[12]  //Esse questionário serve para excluir individuos que seriam exluído na entrevista de triagem clínica
                
            limpa()
            alerta()
            u.aguarde(10000)
            limpa()

            escreva("\nUse S para sim e N para não.\n")
            escreva("1- Você tem menos de 16 anos?\n")
            leia(pre_triagem[0])
            escreva("2- Você tem mais de 69 anos?\n")
            leia(pre_triagem[1])
            escreva("3- Você pesa menos de 50 kg?\n")
            leia(pre_triagem[2])
            escreva("4- Você fez algum procedimento cirúrgico nos últimos 6 meses?\n")
            leia(pre_triagem[3])
            escreva("5- Você fez tatuagem, colocou piercing ou brinco no último ano?\n")
            leia(pre_triagem[4])
            escreva("6- Você tem hepatite, AIDS, Doença de Chagas, malária ou HTLV?\n")
            leia(pre_triagem[5])
            limpa()
            escreva("7- Você faz uso de drogas ilícitas injetávies?\n")
            leia(pre_triagem[6])
            escreva("8- Você tem problemas cardiácos?\n")
            leia(pre_triagem[7])
            escreva("9- Você teve diagnóstico ou suspeta de Covid-19 nos últimos 10 dias?\n")
            leia(pre_triagem[8])
            escreva("10- Você teve contato com pessoas com diagnóstico de Covid-19 nos últimos 7 dias?\n")
            leia(pre_triagem[9])
            escreva("11- Você fez alguma dessas vacinas nas últimas 48 horas (Covaxin/coronavac/Butatan) para Covid-19 ou gripe?\n")
            leia(pre_triagem[10])
            escreva("12- Você fez alguma dessas outras vacinas para Covid-19 nos últimos 7 dias (Astrazeneca/Oxford?fiocruz/Sputinik V/Janssen/Pfizer)?\n")
            leia(pre_triagem[11])
        
            para(inteiro i = 0; i < 12; i++) {
              se (pre_triagem[i] == 's' ou pre_triagem[i] == 'S') {
                impedido = verdadeiro //o usuário só pode doar se todas as respostas forem não
                pare
              }
            }

            se (impedido) { // <-- esse se tava dentro 'para'. vem que ficar fora, senão vai aparecer para cada resposta sim
              escreva("\nInfelizmente, no momento, você não cumpre os requisitos para efetuar a doação.\n")
              escreva("\nLigue para o banco de sangue e saiba mais informações.\n")
              u.aguarde(500)
            } senao {
              escreva("Você será direcionado ao agendamento.")
              u.aguarde(500)
              menuAgendamento()

              inteiro codigoMenuAgendamento=0
              escreva("\nDigite sua opção: ")
              leia(codigoMenuAgendamento)

              escolha(codigoMenuAgendamento){
                caso(1):
                  //lista bancos de sangue e passa para o menu interno que seleciona dia e horário
                  pare

                caso(2):
                  limpa()
                  dicas()
                  u.aguarde(3500)
                  limpa()
                  pare

                caso(3):
                  //retorne ao menu principal
                  pare

                caso contrario:
                //opção inválida

              }
          }
                pare
            caso (2):

              //atualizar cadastro
            pare

            caso (3):
              //voltar ao menu principal
            pare

            caso contrario:
              //opção inválida repetir loop            
          }
          pare

        caso 2: // ADMINISTRADOR
          limpa()
          menuAdmin()
          codigoMenuInterno = recebeCodigo(4)
          enquanto(codigoMenuInterno != 4) {  // enquanto de nível 2 dentro do caso 2 de nivel 1
            escolha(codigoMenuInterno) {  // escolha caso de nível 2 dentro do caso 2 de nivel 1
              caso 1:  // CADASTRAR BANCO
                se (proximoBanco < 5) {  // verifica se as 5 posições já estão coupadas
                  escreva("Nome do Banco de Sange: ")
                  leia(bancos[proximoBanco][0])  // a variável proximoBanco, que começa com zero, representa o número da posição do vetor externo
                  escreva("Endereço: ")
                  leia(bancos[proximoBanco][1])
                  escreva("Horário de atendimento: ")
                  leia(bancos[proximoBanco][2])
                  escreva("Email de contato: ")
                  leia(bancos[proximoBanco][3])
                  escreva("Telefone de contato: ")
                  leia(bancos[proximoBanco][4])
                  proximoBanco++  // incremento para passar para a posição seguinte

                  u.aguarde(500)  // função que gera um pequeno delay. Recebe milisegundos, ou seja, 2000 são 2 segundos
                  escreva("\nBanco de Sangue cadastrado com sucesso!\n")
                  u.aguarde(500)

                } senao {
                  escreva("\n!!! Sem espaço na base de dados !!!\n")  // se as 5 posições estiverem tomadas (posições de 0 a 4) e a variável proximoBanco estiver com valor 5.
                }

                  escreva("\ntecle enter para voltar ao menu")
                  leia(dummy)        

                pare
              caso 2: // LISTAR BANCOS
                se (proximoBanco == 0) {
                  escreva("\n-- Não há bancos cadastrados --\n")
                } senao {
                  escreva("\nLISTA DE BANCOS DE SANGUE CADASTRADOS:\n")
                  para (inteiro i = 0 ; i < proximoBanco ; i++) {
                    escreva("\n############## - ", i + 1 , " - ##############")
                    escreva("\nNome: ", bancos[i][0])
                    escreva("\nEndereço: ", bancos[i][1])
                    escreva("\nAtendimento: ", bancos[i][2])
                    escreva("\nTelefone: ", bancos[i][3])
                    escreva("\nEmail: ", bancos[i][4], "\n")
                  }
                }
                escreva("\ntecle enter para voltar ao menu")
                leia(dummy) 
                pare

              caso 3: // LISTAR DOADORES

                // vou fazer depois que tu fezer a parte de doadores

                pare

              // não precisa do 'caso 4', pois 4 é a saída do menu interno. So o usuário digitar 4, nem vai entrar no 'escola caso'

            }  // fim do escolha caso de nível 2 dentro do caso 2 de nivel 1

            limpa()
            menuAdmin()
            codigoMenuInterno = recebeCodigo(4)

          } // fim do enquanto de nível 2 dentro do caso 2 de nivel 1

          pare

        // não precisa do 'case 3', pois 3 é a saída do sistema. So o usuário digitar 3, nem vai entrar no 'escola caso'

      } // fim do escolha caso de nivel 1.

      u.aguarde(500)
      escreva("\nRetornando ao Menu Principal")
      u.aguarde(2000)
      limpa()
      menuLogin()
      codigoMenuPrincipal = recebeCodigo(3)

    } // fim do enquanto de nivel 1. daqui pra baixo é fim do programa.

  u.aguarde(500)
  escreva("\nFim da execução\n")
  u.aguarde(1000)
  escreva("\nObrigado, nos vemos em breve!!!\n")

  }
}