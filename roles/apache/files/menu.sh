#!/bin/bash

#-------------------------------------#
#   Menu de Opcoes de Inicializacao   #
#-------------------------------------#
#                                     #
# Conjunto de opcoes de inicializacao #
# do apache. Este menu eh utilizado   #
# nos scripts:                        #
#  - start.sh                         #
#  - bin/checkHttpConfig.sh           #
#                                     #
#-------------------------------------#


ARGS=""
MODO=""
op=$1

##### MENU DE OPCOES ######################
while (true); do
        if [ "$1" == "" ]
        then
        clear
        echo "Selecionar Modo de Inicializacao do Apache:

        * Opcoes para todas as aplicaoes:
        1 - Producao Normal
        2 - Mensagem de Indisponibilidade

        * Configurar Indisponibilidade apenas para aplicacoes especificas
        < Nenhuma Cadastrada >

        * Outras opcoes:
        0 - Abortar Execucao

Digite a sua opcao: "

        read op
        fi

        case $op in
        1)      ARGS="$ARGS -DPROD   "
                MODO="[Producao Normal]"
                ;;
        2)      ARGS="$ARGS -DINDISP "
                MODO="[Indisponibilidade Geral]"
                ;;
        0) exit 0 ;;

        *)      if [ "$1" == "" ]
                then
                        echo "ERRO. Opcao invalida."
                        sleep 1
                else
                        exit 1
                fi
                ;;
        esac
        break
done

###########################################

export ARGS MODO