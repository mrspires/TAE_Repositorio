ANÁLISE DESCRITIVA DE DUAS VARIÁVEIS 
#FUNÇÕES PARA O ESTUDO DE DUAS VARIÁVEIS: UMA QUALITATIVA E OUTRA QUANTITATIVA 

#Pacotes que serão usados
install.packages("dplyr")
library(dplyr)


#Quartis da variável Salario no arquivo milsa.csv
with(milsa, quantile(Salario))

#Classes para variável Salario de acordo com os quantis
salario_cut <- with(milsa, cut(Salario, breaks = quantile(milsa$Salario), include.lowest = TRUE))

# Tabela das frequencias absolutas das variáveis Nível de Instrução e Salario
tabela_salario <- with(milsa, table(Inst, salario_cut))
tabela_salario
tabela_salario2 <- prop.table(tabela_salario)
addmargins(tabela_salario2)

# Gráfico a ser apresentado é o Boxplot pois queremos comparar as estatísticas da variável Salario nas categorias da variável Inst
boxplot(Salario ~ Inst, data=milsa)

##Medidas de resumo (média, mediana, desvio padrão, mínimo e máximo) da variavel Salario para cada categoria da variável Inst
with(milsa, tapply(Salario, Inst, mean))
with(milsa, tapply(Salario, Inst, median)) 
with(milsa, tapply(Salario, Inst, sd)) 
with(milsa, tapply(Salario, Inst, min))     
with(milsa, tapply(Salario, Inst, quantile))
with(milsa, tapply(Salario, Inst, max))  

#Todas as métricas estatísticas apresentadas acima estão organizadas numa tabela_estatísticas
tabela_estatisticas <- milsa %>%
  group_by(Inst) %>%
  summarise(
    Min = min(Salario, na.rm = TRUE),
    Q1 = quantile(Salario, 0.25, na.rm = TRUE),
    Mediana = median(Salario, na.rm = TRUE),
    Média = mean(Salario, na.rm = TRUE),
    Q3 = quantile(Salario, 0.75, na.rm = TRUE),
    Máximo = max(Salario, na.rm = TRUE),
    Desvio_Padrão = sd(Salario, na.rm = TRUE),
    .groups = "drop"
  )

print(tabela_estatisticas)

# Ajustar o modelo de ANOVA para o cálculo do coeficiente de determinação
modelo_anova <- aov(Salario ~ Inst, data = milsa)

anova_sum <- summary(modelo_anova)
ss_total <- sum(anova_sum[[1]][, "Sum Sq"])
ss_modelo <- anova_sum[[1]]["Inst", "Sum Sq"]
r_squared <- ss_modelo / ss_total
r_squared

#--------------------------------------------------------------------

#FUNÇÕES PARA O ESTUDO DE DUAS VARIÁVEIS QUANTITATIVAS 
#Classes para variável Anos de acordo com os quartis
anos_cut <- with(milsa, cut(Anos, breaks = quantile(milsa$Anos), include.lowest = TRUE))

#Classes para variável Salario de acordo com os quantis
salario_cut <- with(milsa, cut(Salario, breaks = quantile(milsa$Salario), include.lowest = TRUE))
tabela_sal_anos <- with(milsa, table(salario_cut, anos_cut))
tabela_sal_anos
tabela_sal_anos2 <- prop.table(tabela_sal_anos)
addmargins(tabela_sal_anos2)

# Seleciona apenas as variáveis quantitativas (numéricas)
milsa_quantitativas <- milsa[sapply(milsa, is.numeric)]

# Visualiza o novo data.frame
head(milsa_quantitativas)


# Gráfico a ser apresentado é o de dispersão pois queremos comparar as quantidades das duas variáveis Anos vs Salario
with(milsa, plot(x = Anos, y = Salario, main= "Gráfico de Dispersao"))
#podemos também escrever assim o comando do gráfico de dispersão
plot(Salario ~Anos, data=milsa, main= "Gráfico de Dispersão")

# Gráfico a ser apresentado é o de dispersão pois queremos comparar as quantidades das duas variáveis Anos vs Salario
with(milsa, plot(x = Anos, y = Salario, main= "Gráfico de Dispersao"))
#podemos também escrever assim o comando do gráfico de dispersão
plot(Salario ~Anos, data=milsa, main= "Gráfico de Dispersão")


#Coeficiente de correlação das variáveis quantitativas
with(milsa, cor(Anos, Salario, method = "pearson"))
with(milsa, cor(Salario, Anos, method = "pearson"))

with(milsa, cor(Anos, Salario, method = "spearman"))
with(milsa, cor(Salario, Anos, method = "spearman"))

with(milsa, cor(Anos, Salario, method = "kendal"))
with(milsa, cor(Salario, Anos, method = "kendal"))
