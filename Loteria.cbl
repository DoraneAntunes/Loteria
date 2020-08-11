      $set sourceformat"free"
       identification division.
       program-id. "Loteria".
       Author. "Dorane Antunes".
       date-written. 10/08/2020.
       date-compiled.

       environment division.
       configuration Section.
           special-names. decimal-point is comma.

       input-output Section.
       File-control.
       I-O-Control.

       data division.
       file section.

      *>declaração das variáveis do programa.
       working-storage section.

       77 ws-qtdd_aposta                           pic 9(02) value 0.

       01 ws-aposta.
           05 ws-num1                              pic 9(02) value 0.
           05 ws-num2                              pic 9(02) value 0.
           05 ws-num3                              pic 9(02) value 0.
           05 ws-num4                              pic 9(02) value 0.
           05 ws-num5                              pic 9(02) value 0.
           05 ws-num6                              pic 9(02) value 0.
           05 ws-num7                              pic 9(02) value 0.
           05 ws-num8                              pic 9(02) value 0.
           05 ws-num9                              pic 9(02) value 0.
           05 ws-num10                             pic 9(02) value 0.

       01 ws-sorteio.
           05 ws-semente                           pic 9(10).
           05 ws-semente1                          pic 9(10) value 0.
           05 ws-num-sorteado1                     pic 9(02) value 0.
           05 ws-num-sorteado2                     pic 9(02) value 0.
           05 ws-num-sorteado3                     pic 9(02) value 0.
           05 ws-num-sorteado4                     pic 9(02) value 0.
           05 ws-num-sorteado5                     pic 9(02) value 0.
           05 ws-num-sorteado6                     pic 9(02) value 0.
           05 ws-num_random                        pic 9(01)V9999999.

       77 ws-controle1                             pic x(01).
           88 acertou1                             value "C".
           88 errou1                               value "E".

       77 ws-controle2                             pic x(01).
           88 acertou2                             value "C".
           88 errou2                               value "E".

       77 ws-controle3                             pic x(01).
           88 acertou3                             value "C".
           88 errou3                               value "E".

       77 ws-controle4                             pic x(01).
           88 acertou4                             value "C".
           88 errou4                               value "E".

       77 ws-controle5                             pic x(01).
           88 acertou5                             value "C".
           88 errou5                               value "E".

       77 ws-controle6                             pic x(01).
           88 acertou6                             value "C".
           88 errou6                               value "E".

       77 ws-controle7                             pic x(01).
           88 acertou7                             value "C".
           88 errou7                               value "E".

       77 ws-controle8                             pic x(01).
           88 acertou8                             value "C".
           88 errou8                               value "E".

       77 ws-controle9                             pic x(01).
           88 acertou9                             value "C".
           88 errou9                               value "E".

       77 ws-controle10                            pic x(01).
           88 acertou10                            value "C".
           88 errou10                              value "E".

       77 ws-tentativas                            pic 9(18) value 0.

       01 ws-tempo-inicio.
          05 ws-hora-inicio                        pic 9(02).
          05 ws-min-inicio                         pic 9(02).
          05 ws-seg-inicio                         pic 9(02).

       01 ws-tempo-final.
          05 ws-hora-final                         pic 9(02).
          05 ws-min-final                          pic 9(02).
          05 ws-seg-final                          pic 9(02).

       01 ws-total.
           05 ws-hora-total                        pic 9(02).
           05 ws-min-total                         pic 9(02).
           05 ws-seg-total                         pic 9(02).


      *>Usado no programa chamado, variáveis em comum.
       linkage section.

      *>construção de telas.
       screen section.

      *>Declaração dos Procedimentos, do corpo do programa
       Procedure Division.

           perform inicializa.
           perform processamento.
           perform finaliza.

      *>-------------------------------------------------------------------------------------------
       inicializa section.
      *>-------------------------------------------------------------------------------------------

           .
       inicializa-exit.
           exit.
      *>-------------------------------------------------------------------------------------------
       processamento section.
      *>-------------------------------------------------------------------------------------------
               *> tela do usuário, onde serão recebidos a quantidade de aposta.
               display " $ Bem-Vindo ao Sistema de Aposta da Loteria $ " at 0516
               display " Numero minimo de apostas     Numero maximo"     at 0718
               display "         06                        10      "     at 0819
               display " Quantos numeros deseja apostar? " at 1122
               accept ws-qtdd_aposta at 1237

               *> tratamento, caso os números da aposta seja menor ou maior que o permitido pelo jogo.
               if ws-qtdd_aposta < 6 or ws-qtdd_aposta > 10 then

                   display" A quantidade de aposta minima eh 6 numeros e no max. 10 " at 2016
                   accept ws-qtdd_aposta
               else
                       *> chamada da section que irá verificar a quantidade de numeros
                       *> escolhidos para a aposta.
                       perform aposta
               end-if

                       *> chamada da section que fará o sorteio dos números.
                       perform sorteio


           .
       processamento-exit.
           exit.
      *>-------------------------------------------------------------------------------------------
      *>===========================================================================================
        aposta section.
      *>===========================================================================================
           *> verificação da quantidade de números escolhidos pelo usuário.

           evaluate ws-qtdd_aposta
               *> se a quantidade foi 6, irá se abrir 6 campos para que seja digitado
               *> os números escolhidos.
               when = 6
                   display " Escolha os numeros que deseja apostar: " at 1418
                   accept ws-num1 at 1519
                   accept ws-num2 at 1523
                   accept ws-num3 at 1527
                   accept ws-num4 at 1531
                   accept ws-num5 at 1535
                   accept ws-num6 at 1539

               *> se a quantidade foi 7, irá se abrir 7 campos para que seja digitado
               *> os números escolhidos.
               when = 7
                   display " Escolha os numeros que deseja apostar: " at 1405
                   accept ws-num1 at 1519
                   accept ws-num2 at 1523
                   accept ws-num3 at 1527
                   accept ws-num4 at 1531
                   accept ws-num5 at 1535
                   accept ws-num6 at 1539
                   accept ws-num7 at 1543

               *> se a quantidade foi 8, irá se abrir 8 campos para que seja digitado
               *> os números escolhidos.
               when = 8
                   display " Escolha os numeros que deseja apostar: " at 1405
                   accept ws-num1 at 1519
                   accept ws-num2 at 1523
                   accept ws-num3 at 1527
                   accept ws-num4 at 1531
                   accept ws-num5 at 1535
                   accept ws-num6 at 1539
                   accept ws-num7 at 1543
                   accept ws-num8 at 1547

               *> se a quantidade foi 9, irá se abrir 9 campos para que seja digitado
               *> os números escolhidos.
               when = 9
                   display " Escolha os numeros que deseja apostar: " at 1405
                   accept ws-num1 at 1519
                   accept ws-num2 at 1523
                   accept ws-num3 at 1527
                   accept ws-num4 at 1531
                   accept ws-num5 at 1535
                   accept ws-num6 at 1539
                   accept ws-num7 at 1543
                   accept ws-num8 at 1547
                   accept ws-num9 at 1551

               *> se a quantidade foi 10, irá se abrir 10 campos para que seja digitado
               *> os números escolhidos.
               when = 10
                   display " Escolha os numeros que deseja apostar: " at 1405
                   accept ws-num1  at 1519
                   accept ws-num2  at 1523
                   accept ws-num3  at 1527
                   accept ws-num4  at 1531
                   accept ws-num5  at 1535
                   accept ws-num6  at 1539
                   accept ws-num7  at 1543
                   accept ws-num8  at 1547
                   accept ws-num9  at 1551
                   accept ws-num10 at 1555

           end-evaluate

                   *> condição para verificar se algum número é igual a 0 ou
                   *> maior que 60. O que não será permitido no jogo.
                   if ws-num1 = 00 or ws-num2 = 00
                   or ws-num3 = 00 or ws-num4 = 00
                   or ws-num5 = 00 or ws-num6 = 00 then

                       display" Os numeros apostados devem estar entre 01 e 60 " at 2016

                       if ws-num1 > 60 or ws-num2 > 60
                       or ws-num3 > 60 or ws-num4 > 60
                       or ws-num5 > 60 or ws-num6 > 60 then

                           display" Os numeros apostados devem estar entre 01 e 60 " at 2016

                       else

                           display erase

                       end-if
                   end-if

           .
       aposta-exit.
           exit.
      *>===========================================================================================
       sorteio section.
      *>===========================================================================================
                  *> Start da contagem de tempo do sorteio.
                  move function current-date(9:6) to ws-hora-inicio

           *> Repetindo o sorteio até que os números sorteados sejam iguais aos apostados.
           perform until (acertou1 and acertou2 and acertou3 and acertou4 and acertou5 and acertou6)
           *> adicionando 1 a cada tentativa de acerto.
           Add 1 to ws-tentativas

               *> gerando numero aleatorio para ser o primeiro sorteado
               accept ws-semente from time
               perform delay-sorteio *> Atraso de 1 centésimo de segundo no numero sorteado
               compute ws-num_random = function random(ws-semente)
               multiply ws-num_random by 60 giving ws-num-sorteado1

               *> gerando numero aleatorio para ser o segundo sorteado
               *> com tratamento para que seja diferente dos demais números sorteados
               perform until ws-num-sorteado2 <> ws-num-sorteado1 and ws-num-sorteado2 <> 00
                   accept ws-semente from time
                   perform delay-sorteio *> Atraso de 1 centésimo de segundo no numero sorteado
                   compute ws-num_random = function random(ws-semente)
                   multiply ws-num_random by 60 giving ws-num-sorteado2
               end-perform

                   *> gerando numero aleatorio para ser o terceiro sorteado
                   *> com tratamento para que seja diferente dos demais números sorteados
                    perform until ws-num-sorteado3 <> ws-num-sorteado2
                       and ws-num-sorteado3 <> ws-num-sorteado1 and ws-num-sorteado3 <> 00
                       accept ws-semente from time
                       perform delay-sorteio *> Atraso de 1 centésimo de segundo no numero sorteado
                       compute ws-num_random = function random(ws-semente)
                       multiply ws-num_random by 60 giving ws-num-sorteado3
                    end-perform

                       *> gerando numero aleatorio para ser o quarto sorteado
                       *> com tratamento para que seja diferente dos demais números sorteados
                       perform until ws-num-sorteado4 <> ws-num-sorteado3
                           and ws-num-sorteado4 <> ws-num-sorteado2
                           and ws-num-sorteado4 <> ws-num-sorteado1 and ws-num-sorteado4 <> 00
                           accept ws-semente from time
                           perform delay-sorteio *> Atraso de 1 centésimo de segundo no numero sorteado
                           compute ws-num_random = function random(ws-semente)
                           multiply ws-num_random by 60 giving ws-num-sorteado4
                       end-perform

                           *> gerando numero aleatorio para ser o quinto sorteado
                           *> com tratamento para que seja diferente dos demais números sorteados
                           perform until ws-num-sorteado5 <> ws-num-sorteado4
                               and ws-num-sorteado5 <> ws-num-sorteado3
                               and ws-num-sorteado5 <> ws-num-sorteado2
                               and ws-num-sorteado5 <> ws-num-sorteado1 and ws-num-sorteado5 <> 00
                               accept ws-semente from time
                               perform delay-sorteio *> Atraso de 1 centésimo de segundo no numero sorteado
                               compute ws-num_random = function random(ws-semente)
                               multiply ws-num_random by 60 giving ws-num-sorteado5
                           end-perform

                               *> gerando numero aleatorio para ser o sexto sorteado
                               *> com tratamento para que seja diferente dos demais números sorteados
                               perform until ws-num-sorteado6 <> ws-num-sorteado5
                                   and ws-num-sorteado6 <> ws-num-sorteado4
                                   and ws-num-sorteado6 <> ws-num-sorteado3
                                   and ws-num-sorteado6 <> ws-num-sorteado2
                                   and ws-num-sorteado6 <> ws-num-sorteado1 and ws-num-sorteado6 <> 00
                                   accept ws-semente from time
                                   perform delay-sorteio *> Atraso de 1 centésimo de segundo no numero sorteado
                                   compute ws-num_random = function random(ws-semente)
                                   multiply ws-num_random by 60 giving ws-num-sorteado6

                                   *> chamando a section verificacao para comparar se os
                                   *> números sorteados são iguais aos números apostados
                                   perform verificacao

                                   *> Display dos numeros sorteados para acompanhamento.
                                   display ws-num-sorteado1 " " ws-num-sorteado2 " " ws-num-sorteado3 " "
                                           ws-num-sorteado4 " " ws-num-sorteado5 " " ws-num-sorteado6

                               end-perform

           end-perform
                       *> Finalização da contagem de tempo do sorteio
                       move function current-date(9:6) to ws-hora-final

                       *> Display dos numeros apostados, para visualização que o
                       *> perform encerrou com os números iguais aos sorteados.
                       display " Os numeros apostados foram: "
                       display ws-num1 at 0730 " " ws-num2 at 0734 " " ws-num3 at 0738 " " ws-num4 at 0742 " " ws-num5 at 0746 " " ws-num6
                       display " "
                       *> display do numero de tentativas necessárias para o acerto.
                       display " Quantidade de tentativas: " ws-tentativas
                       *> tempo gasto para o acerto da aposta.
                       display " Tempo total gasto: " ws-total

           .
       sorteio-exit.
           exit.
      *>===========================================================================================
       verificacao section.
      *>===========================================================================================
               *> controle para verificação quando um determinado número foi acertado.
               set errou1 to true   set errou2 to true   set errou3 to true
               set errou4 to true   set errou5 to true   set errou6 to true
               set errou7 to true   set errou8 to true   set errou9 to true
                                    set errou10 to true

      *> comparação dos numeros apostados e os sorteados.
                       if  ws-num1  = ws-num-sorteado1 or
                           ws-num2  = ws-num-sorteado1 or
                           ws-num3  = ws-num-sorteado1 or
                           ws-num4  = ws-num-sorteado1 or
                           ws-num5  = ws-num-sorteado1 or
                           ws-num6  = ws-num-sorteado1 or
                           ws-num7  = ws-num-sorteado1 or
                           ws-num8  = ws-num-sorteado1 or
                           ws-num9  = ws-num-sorteado1 or
                           ws-num10 = ws-num-sorteado1 then

                           set acertou1 to true

                           if  ws-num1  = ws-num-sorteado2 or
                               ws-num2  = ws-num-sorteado2 or
                               ws-num3  = ws-num-sorteado2 or
                               ws-num4  = ws-num-sorteado2 or
                               ws-num5  = ws-num-sorteado2 or
                               ws-num6  = ws-num-sorteado2 or
                               ws-num7  = ws-num-sorteado2 or
                               ws-num8  = ws-num-sorteado2 or
                               ws-num9  = ws-num-sorteado2 or
                               ws-num10 = ws-num-sorteado2 then

                               set acertou2 to true

                               if  ws-num1  = ws-num-sorteado3 or
                                   ws-num2  = ws-num-sorteado3 or
                                   ws-num3  = ws-num-sorteado3 or
                                   ws-num4  = ws-num-sorteado3 or
                                   ws-num5  = ws-num-sorteado3 or
                                   ws-num6  = ws-num-sorteado3 or
                                   ws-num7  = ws-num-sorteado3 or
                                   ws-num8  = ws-num-sorteado3 or
                                   ws-num9  = ws-num-sorteado3 or
                                   ws-num10 = ws-num-sorteado3 then

                                   set acertou3 to true

                                   if  ws-num1  = ws-num-sorteado4 or
                                       ws-num2  = ws-num-sorteado4 or
                                       ws-num3  = ws-num-sorteado4 or
                                       ws-num4  = ws-num-sorteado4 or
                                       ws-num5  = ws-num-sorteado4 or
                                       ws-num6  = ws-num-sorteado4 or
                                       ws-num7  = ws-num-sorteado4 or
                                       ws-num8  = ws-num-sorteado4 or
                                       ws-num9  = ws-num-sorteado4 or
                                       ws-num10 = ws-num-sorteado4 then

                                       set acertou4 to true

                                       if  ws-num1  = ws-num-sorteado5 or
                                           ws-num2  = ws-num-sorteado5 or
                                           ws-num3  = ws-num-sorteado5 or
                                           ws-num4  = ws-num-sorteado5 or
                                           ws-num5  = ws-num-sorteado5 or
                                           ws-num6  = ws-num-sorteado5 or
                                           ws-num7  = ws-num-sorteado5 or
                                           ws-num8  = ws-num-sorteado5 or
                                           ws-num9  = ws-num-sorteado5 or
                                           ws-num10 = ws-num-sorteado5 then

                                           set acertou5 to true

                                           if  ws-num1  = ws-num-sorteado6 or
                                               ws-num2  = ws-num-sorteado6 or
                                               ws-num3  = ws-num-sorteado6 or
                                               ws-num4  = ws-num-sorteado6 or
                                               ws-num5  = ws-num-sorteado6 or
                                               ws-num6  = ws-num-sorteado6 or
                                               ws-num7  = ws-num-sorteado6 or
                                               ws-num8  = ws-num-sorteado6 or
                                               ws-num9  = ws-num-sorteado6 or
                                               ws-num10 = ws-num-sorteado6 then

                                               set acertou6 to true

                                            end-if
                                       end-if
                                   end-if
                               end-if
                           end-if
                   end-if

           .
       verificacao-exit.
           exit.
      *>===========================================================================================
       tempo section.
      *>===========================================================================================
           *> cálculo do tempo gasto para a execução do programa.
           compute ws-hora-total = (ws-hora-final - ws-hora-inicio)
           compute  ws-min-total = (ws-min-final - ws-min-final)
           compute  ws-seg-total = (ws-seg-final - ws-seg-final)
           .
       tempo-exit.
           exit.

      *>===========================================================================================
       delay-sorteio section.  *> delay de 1 centésimo de segundo
      *>===========================================================================================
           *> delay de 1 centésimo de segundo.
           perform 10 times
               accept ws-semente from time
               move ws-semente1    to ws-semente
               perform until ws-semente > ws-semente1
                   accept ws-semente from time
               end-perform
           end-perform

           .
       delay-sorteio-exit.
           exit.
      *>-------------------------------------------------------------------------------------------
       finaliza section.
      *>-------------------------------------------------------------------------------------------

           Stop Run

           .
       finaliza-exit.
           exit.

