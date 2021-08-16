#!/bin/bash

#Abra a pasta desejada
cd ~/Downloads/imagens-livros/

#Criando uma função referente ao meu código
converte(){
#Se NÃO existir o Diretório X, ENTÃO .... CRIE diretorio
if [ ! -d png ]
then
	mkdir png
fi

for imagem in *.jpg
do
	imagem_sx=$(ls $imagem | awk -F. '{print $1}')
	convert $imagem_sx.jpg png/$imagem_sx.png
done
}

#Invocando a função e atribuindo o parametro 2 (mensagem de erro) para um arquivo txt de erros

converte 2 >> erros.txt

#Verificando o status de saída 
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso."
else
	echo "A conversão falhou"
fi
