#ANÁLISE DE DADOS DE DUAS VARIÁVEIS:
#FUNÇÕES PARA O ESTUDO DE DUAS VARIÁVEIS QUALITATIVAS

# Instalação do pacote DescTools
install.packages("DescTools")
library(DescTools)

# Contruir a tabela de dupla entrada ou tabela de contingência com frequencia absoluta com os rótulos
tabela_contingencia <- with(milsa, table(Est.civil, Inst))
print(tabela_contingencia)


# Para que essa tabela tenha as somas das coluna e linhas
addmargins(tabela_contingencia)

# Contruir a tabela de dupla entrada ou tabela de contingência com frequencia relativa
prop.table(tabela_contingencia)
prop.table(tabela_contingencia, margin = 1)
prop.table(tabela_contingencia, margin = 2)

# Construção dos gráficos 
# A função par() aceita uma série de argumentos que controlam diferentes aspectos dos gráficos, tais como layout, margens, aparência dos eixos, cores, entre outros
#o argumento mfrow é um vetor de dois valores que especifica o número de linhas e colunas de gráficos que você deseja em uma única janela gráfica.
#mfcol é semelhante ao mfrow, mas os gráficos são preenchidos em colunas, em vez de linhas.
#main, sub, xlab, ylab:Define títulos para o gráfico principal, subtítulo, rótulo do eixo x e rótulo do eixo y, respectivamente.
par(mfrow = c(1, 1))
barplot(tabela_contingencia, main = "Estado Civil", xlab = "Nível de Instrução", ylab = "Frequência", beside = TRUE, legend = TRUE)
barplot(t(tabela_contingencia), col= c("#009999", "#0000FF", "#E1E1E1"), main = "Nível de Instrução", xlab = "Estado Civil", ylab = "Frequência", beside = TRUE, legend = TRUE)

# Calcular o coeficiente de contingência a partir da fórmula executando o teste Qui-quadrado
tabela <- table(milsa$Est.civil, milsa$Inst)
qui_quadrado <- chisq.test(tabela)

# Valor do Qui-quadrado
X2 <- qui_quadrado$statistic  
# Número total de observações
n <- sum(tabela)     
# Fórmula do coeficiente de contingência
C <- sqrt(X2 / (X2 + n)) 

# Mostrar o valor do coeficiente de contingência
C


# Cálculo do coeficiente de contingência para duas ou mais variáveis qualitativas
coef_contingencia <- ContCoef(tabela_contingencia)
print(coef_contingencia)
