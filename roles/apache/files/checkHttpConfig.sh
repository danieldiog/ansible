#!/bin/bash

#----------------------------------------------#
#       Verificador de Configuracoes           #
#----------------------------------------------#
#                                              #
# Este script eh util para testar os arquivos  #
# de configuracao deste ambiente, sem ser      #
# necessario reiniciar o apache.               #
#                                              #
#----------------------------------------------#

scriptDir=dirname "$0"

#Configura variaveis de ambiente
. ${scriptDir}/setHttpEnv.sh

#Obtem argumentos do menu
for op in 1 2 3 4 5 6 7 8 9
do
        . ${scriptDir}/menu.sh $op

        if [ "$?" == "1" ]
        then
                break
        fi

        HTTP_ARGUMENTS="-DSSL $ARGS"
        COMANDO="${CMD_HTTPD} -t -d ${HTTP_SERVER_ROOT} ${HTTP_ARGUMENTS}"

        #Verifica se as configuracoes estao corretas

        echo ""
        echo "* VERIFICANDO CONFIGURACAO"
        echo "    -> Modo = $MODO"
        echo "    -> Comando de Teste = $COMANDO"
        echo ""
        echo "    => Resultado Do Teste = "
        ${CMD_HTTPD} -t -d ${HTTP_SERVER_ROOT} ${HTTP_ARGUMENTS}
        echo ""
        echo ""

done

echo ""
echo "FIM DA VERIFICACAO"
echo ""