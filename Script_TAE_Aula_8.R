# Tabela para as duas variveis de qualidade e uma de quantidade
tabela <- with(milsa, ftable(Regiao, Est.civil, Inst))
prop.table(tabela)

# Medidas descritivas para múltiplas variáveis
# Funçao aggregate é usada para agrupar dados pela combinação das categorias de duas ou mais variáveis qualitativas
resumo_salario <- aggregate(Salario ~ Est.civil + Inst, data = milsa, FUN = summary)
print(resumo_salario)

# Gráfico a ser apresentado é o Boxplot pois queremos comparar as estatísticas da variável Salario nas categorias da variável Inst
boxplot(Salario ~ Inst * Est.civil, data=milsa, main = "Salarios", xlab = "Nível de Instrução x Estado Civil")

# Instalar os pacotes para visualização da matriz de correlação
install.packages("corrplot")
install.packages("ggcorrplot")
library(corrplot)
library(ggcorrplot)

#Para calcular a média de uma variável que contém dados faltantes (ou ocultos como NA) em R,é necessário ignorar esses valores NA durante o cálculo. 
#Isso pode ser feito utilizando o parâmetro na.rm = TRUE na função mean().
valor_substituto <- mean(milsa$Filhos, na.rm = TRUE)

#A função replace() é uma maneira simples de substituir valores NA
data$variavel <- replace(milsa$Filhos, is.na(data$variavel), valor_substituto)

# Visualizar a matriz de correlação de três ou mais variáveis quantitativas
matriz_correlacao <- data.frame(milsa$Salario, milsa$Anos, milsa$Filhos)
corrplot(matriz_correlacao, method = "circle")

# Visualizar a matriz de correlação com ggcorrplot
ggcorrplot(matriz_correlacao, lab = TRUE)

# Instalar pacotes para calcular a medida de associação entre variáveis qualitativas
install.packages("FactoMineR")
install.packages("factoextra")

library(FactoMineR)
library(factoextra)

# Realizar a MCA 
resultado_mca <- MCA(Regiao + Est.civil + Inst, data = milsa, graph = FALSE)

# Visualizar as variáveis 
fviz_mca_biplot(resultado_mca, repel = TRUE, ggtheme = theme_minimal())
 

