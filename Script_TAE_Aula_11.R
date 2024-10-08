# REGULARIZAÇÃO - APRENDIZADO SUPERVISIONADO

##Pacotes que serão utilizados:
install.packages("glmnet")
library(glmnet)


# a função lm() ajusta o modelo de regressão linear multivariaveis
# com a summary() para obter os estimadores de mínimos quadrados
pulmao_lm <- lm(antracose ~ idade + tmunic + htransp + cargatabag + ses + densid + distmin, data = antracose2)
summary(pulmao_lm)


#Para extrair as variáveis explicativas e a variável resposta
#X recebe uma matriz das 7 variáveis explicativas data.matrix()
#y recebe variável resposta
y <- antracose2$antracose
X <- antracose2[ , -c(5)]
X <- data.matrix(X)


# Para ajustar o modelo Ridge
# o argumento  alpha = 0 na função cv.glmnet()  indica que estamos fazendo o modelo Ridge
modelo_Ridge = cv.glmnet(X, y, alpha = 0)

#gerando o gráfico dessa regularização
plot(modelo_Ridge)

# os coeficientes  são obtidos por meio da função coef ()
coef(modelo_Ridge, s = "lambda.min")
modelo_Ridge$lambda.min
sqrt(modelo_Ridge$cvm[modelo_Ridge$lambda == modelo_Ridge$lambda.min])

#Os valores preditos para os elementos do conjunto de dados e a correspondente raiz quadrada do MSE (RMSE) são obtidos por meio das funções predict( ) e sqrt ( ).
predict(modelo_Ridge, X, s = "lambda.min")

# Para ajustar o modelo Lasso
# o argumento  alpha = 1 na função glmnet()  indica que estamos fazendo Lasso
modelo_Lasso <- cv.glmnet(X, y, alpha = 1) 

#gerando o gráfico dessa regularização
plot(modelo_Lasso)

# os coeficientes  são obtidos por meio da função coef ()
coef(modelo_Lasso, s = "lambda.min")
modelo_Lasso$lambda.min
sqrt(modelo_Lasso$cvm[modelo_Lasso$lambda == modelo_Lasso$lambda.min])

# Para ajustar o modelo Elastic Net
# o argumento  alpha = 0,5 na função glmnet()  indica que estamos fazendo Elastic Net
modelo_Elastic <- cv.glmnet(X, y, alpha = 0.5) 

#gerando o gráfico dessa regularização
plot(modelo_Elastic)

# os coeficientes  são obtidos por meio da função coef ()
coef(modelo_Elastic, s = "lambda.min")
modelo_Elastic$lambda.min
sqrt(modelo_Elastic$cvm[modelo_Elastic$lambda == modelo_Elastic$lambda.min])
