# ANÁLISE DESCRITIVA: VARIÁVEIS QUALITATIVAS E QUANTITATIVAS


# construir e apresentar as tabelas das variáveis qualitativas (chr) 
tabela_ingles <- table(ceagfgv$ingles)
tabela_ingles_porcentagem <- prop.table(tabela_ingles)
tabela_ingles_acumulada <- cumsum(tabela_ingles_porcentagem)
Tabela_completa <- cbind(Contagens = tabela_ingles,
                         "%" = tabela_ingles_porcentagem,
                         "% Acumulada" = tabela_ingles_acumulada)
print(Tabela_completa)


# construir tabela de contingência para duas variáveis categóricas
tabela_contingencia <- table(ceagfgv$estcivil, ceagfgv$bebida)
print(tabela_contingencia)

#construção do gráfico de barras das variáveis categóricas
grafico_barras <- barplot(tabela_ingles, main = "Fluencia", ylab = "frequencia", horiz = FALSE)
grafico_colunas <- barplot(tabela_ingles, main = "Fluencia", ylab = "frequencia", horiz = TRUE)

#construir o histograma das variáveis quantitativas
tabela_salario <- hist(ceagfgv$salario, main = "Salarios", xlab = "reais", ylab = "frequencia")
grafico_barras <- barplot(ceagfgv$anosformado, main = "Anos formado", ylab = "frequencia", horiz = FALSE)

#obter as medidas de posição das variaveis quantitativas
Salarios <- summary(ceagfgv$salario)
Anos_formado <- summary(ceagfgv$anosformado)
Numero_de_filhos <- summary(ceagfgv$filhos)
Tabela_quantitativas <- cbind(Salarios, Anos_formado, Numero_de_filhos)
print(Tabela_quantitativas)

#obter o boxplot das variaveis quantitativas
boxplot(Salarios, main = "Salarios", ylab = "reais")
boxplot(Anos_formado, Numero_de_filhos)
