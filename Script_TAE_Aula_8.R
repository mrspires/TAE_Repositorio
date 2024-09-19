# Tabela para as duas variveis de qualidade e uma de quantidade
tabela <- with(milsa, ftable(Regiao, Est.civil, Inst))
prop.table(tabela)

# Medidas descritivas para múltiplas variáveis
# Funçao aggregate é usada para agrupar dados pela combinação das categorias de duas ou mais variáveis qualitativas
resumo_salario <- aggregate(Salario ~ Est.civil + Inst, data = milsa, FUN = summary)
print(resumo_salario)

# Gráfico a ser apresentado é o Boxplot pois queremos comparar as estatísticas da variável Salario nas categorias da variável Inst
boxplot(Salario ~ Inst * Est.civil, data=milsa, main = "Salarios", xlab = "Nível de Instrução x Estado Civil")


#Para calcular a média de uma variável que contém dados faltantes (ou ocultos como NA) em R,é necessário ignorar esses valores NA durante o cálculo. 
#Isso pode ser feito utilizando o parâmetro na.rm = TRUE na função mean().
valor_substituto <- mean(milsa$Filhos, na.rm = TRUE)

#A função replace() é uma maneira simples de substituir valores NA na variável 
milsa$Filhos <- replace(milsa$Filhos, is.na(milsa$Filhos), valor_substituto)

# Instalar os pacotes para visualização da matriz de correlação
install.packages("ggplot2")
library(ggplot2)

install.packages("corrplot")
library(corrplot)

install.packages("ggcorrplot")
library(ggcorrplot)

# Visualizar a matriz de correlação de três ou mais variáveis quantitativas
matriz_correlacao <- data.frame(milsa$Salario, milsa$Anos, milsa$Filhos)
matriz <- cor(matriz_correlacao, use = "complete.obs")

#Os método da função são para visualizar as correlações na matriz e são:
# "circle", "square", "ellipse", "number", "shade", "color", "pie"
corrplot(matriz, method = "circle")

# Visualizar a matriz de correlação com ggcorrplot
ggcorrplot(matriz, lab = TRUE)


# Instalar pacotes para calcular a medida de associação entre variáveis qualitativas
install.packages("FactoMineR")
library(FactoMineR)

install.packages("factoextra")
library(factoextra)

# Realizar a MCA 
mca_variaveis <- data.frame(milsa$Regiao, milsa$Est.civil , milsa$Inst)
resultado_mca <- MCA(mca_variaveis, graph = FALSE)

# Visualizar as variáveis 
fviz_mca_biplot(resultado_mca, repel = TRUE, ggtheme = theme_minimal())

#A MCA simplifica a análise de dados categóricos, revelando as relações entre categorias e observações.
#Os eixos principais explicam as variações mais significativas.
#A interpretação se dá pela proximidade, contribuição e qualidade de representação de categorias e indivíduos no gráfico.
#Interpretar a MCA requer analisar tanto as categorias quanto as observações e como elas se relacionam com os eixos principais, 
#buscando padrões ou agrupamentos importantes.

