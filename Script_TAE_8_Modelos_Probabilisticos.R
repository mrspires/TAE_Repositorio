#ANÁLISE DESCRITIVA DE UMA VARIÁVEL: MEDIDAS DE RESUMO DE FORMA 
#E OS MODELOS PROBABILÍSTICOS 

#Carregar os pacotes necessários
library(ggplot2)

#Medidas de variabilidade e posição
dp_salario <- sd(ceagfgv$salario)
media_salario <- mean(ceagfgv$salario)

#Medidas de forma
coef_assimetria_salario <- skewness(ceagfgv$salario)
print(coef_assimetria_salario)
coef_curtose_salario <- kurtosis(ceagfgv$salario)
print(coef_curtose_salario)

# histograma
hist(ceagfgv$salario, col = "lightblue", probability = TRUE, 
     main = "Salário", ylab = "Densidade", xlab = "Valores")

#Adicionar curva da distribuição normal à distribuição da variável em estudo
curve(dnorm(x, mean(ceagfgv$salario), sd(ceagfgv$salario)), 
      add = TRUE, col = "darkgreen", lwd = 2)

# Plotando o histograma e a curva de densidade usando ggplot2
ggplot(data.frame(ceagfgv$salario), aes(x = ceagfgv$salario)) +
  geom_histogram(aes(y = ..density..), bins = 15, fill = "blue", alpha = 0.6) +
  geom_density(color = "pink", size = 1.5) +
  labs(title = "Histograma e Curva de Densidade dos Salários",
       x = "Salário",
       y = "Densidade") +
  theme_minimal()

#Funções para a Distribuição Normal X ~ N(0, 1)
#d calcula a densidade de probabilidade f(x) no ponto x
#dnorm => densidade no ponto x = -1 
dnorm(-1)

#p calcula a função de probabilidade acumulada F(x) no ponto x
#pnorm => P(X < -1)
pnorm(-1)

#q calcula o quantil correspondente a uma dada probabilidade
#qnorm => P( X < a) = 0,975  logo a = 1,959964
qnorm(0.975)

#r retorna uma amostra aleatória da distribuição
#rnorm => gerou uma amostra de 100 elementos para a Normal Padrão
amostra <- rnorm(100)

#Plotar a distribuição Normal 
plot(dnorm, from = -4, to =4, col = "darkred", main = "Distribuição Normal,  X ~ N(0, 1)", 
     xlab ="Valores de x", ylab = "Densidade de probabilidade")