#Contruir a tabela de dupla entrada ou tabela de contingência com frequencia absoluta
tabela_contingencia <- with(milsa, table(Est.civil, Inst))

#Para que essa tabela tenha as somas das coluna e linhas
addmargins(tabela_contingencia)

#Contruir a tabela de dupla entrada ou tabela de contingência com frequencia relativa
prop.table(tabela_contingencia)
prop.table(tabela_contingencia, margin = 1)
prop.table(tabela_contingencia, margin = 2)

#Construção dos gráficos 
#A função par() aceita uma série de argumentos que controlam diferentes aspectos dos gráficos, tais como layout, margens, aparência dos eixos, cores, entre outros
#o argumento mfrow é um vetor de dois valores que especifica o número de linhas e colunas de gráficos que você deseja em uma única janela gráfica.
#mfcol é semelhante ao mfrow, mas os gráficos são preenchidos em colunas, em vez de linhas.
#main, sub, xlab, ylab:Define títulos para o gráfico principal, subtítulo, rótulo do eixo x e rótulo do eixo y, respectivamente.
par(mfrow = c(1, 1))
barplot(tabela_contingencia, main = "Estado Civil", xlab = "Nível de Instrução", ylab = "Frequência", beside = TRUE, legend = TRUE)
barplot(t(tabela_contingencia),main = "Nível de Instrução", xlab = "Estado Civil", ylab = "Frequência", beside = TRUE, legend = TRUE)

