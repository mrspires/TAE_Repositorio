# a função lm() ajusta o modelo de regressão linear
modelo_simples <- lm(distancia ~ idade, data = distancia)
modelo_simples

modelo_multiplo <- lm(VO2 ~ IMC + carga, data = esteira)
modelo_multiplo

#Apresenta o gráfico de dispersão do modelo e a função linear plotada pela função abline()
plot(distancia ~ idade, data = distancia, xlab = "Idade (em anos)", ylab = "Distancia (m)", main = "Gráfico de Dispersão")
abline(modelo_simples, col = "red")


# A função summary() apresenta um resumo estatístico do modelo
resumo <- summary(modelo_simples)
print(resumo)

resumos <- summary(modelo_multiplo)
print(resumos)

#apresenta o gráfico dos resíduos do modelo ajustado
residuos <- resumo$residuals
plot(residuos)




