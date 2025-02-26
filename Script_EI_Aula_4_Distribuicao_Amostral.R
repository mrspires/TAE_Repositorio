# Definir a semente para reprodutibilidade
set.seed(42)

# Criar uma população não normal (distribuição exponencial)
populacao <- rexp(10000, rate = 1/50)  # Média da exponencial = 50

# Definir parâmetros da amostragem
n_amostras <- 1000  # Número de amostras
tamanho_amostra <- 30  # Tamanho de cada amostra
medias_amostrais <- numeric(n_amostras)  # Vetor para armazenar as médias

# Coletar amostras e calcular as médias
for (i in 1:n_amostras) {
  amostra <- sample(populacao, tamanho_amostra, replace = TRUE)
  medias_amostrais[i] <- mean(amostra)
}

# Gráfico: Distribuição da população
hist(populacao, breaks = 50, col = "red", probability = TRUE, 
     main = "Distribuição da População (Exponencial)", xlab = "Valores")

# Mostra que a população tem uma distribuição exponencial (assimétrica, com cauda longa)


# Gráfico: Distribuição Amostral da Média
hist(medias_amostrais, breaks = 50, col = "blue", probability = TRUE, 
     main = "Distribuição Amostral da Média (TLC)", xlab = "Média Amostral")

# Mostra a distribuição das médias amostrais, que se torna aproximadamente normal.


# Adicionar curva normal à distribuição da média amostral
curve(dnorm(x, mean(medias_amostrais), sd(medias_amostrais)), 
      add = TRUE, col = "darkgreen", lwd = 2)

#A curva verde representa uma distribuição normal ajustada à média amostral.

##Conclusão:
#Mesmo que a população original não seja normal, as médias amostrais seguem uma distribuição normal,
#confirmando o Teorema do Limite Central (TLC).