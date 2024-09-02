#Instalação do pacote caret
install.packages("caret")
library(caret)

# Usando a função glm() para obter os coeficientes da regressão logistica.
dist_aberta <- glm(deslocamento ~ dist_aberta, family = binomial, data = disco)
summary(dist_aberta)

dist_fechada <- glm(deslocamento ~ dist_fechada, family = binomial, data = disco)
summary(dist_fechada)

ambas_dist <- glm(deslocamento ~ dist_aberta + dist_fechada, family = binomial, data = disco)
summary(ambas_dist)

#Ajuste do modelo de classificação por validação cruzada usando o método LOOCV
#repetindo o método por 5 vezes
train_control = trainControl(method= "LOOCV", number = 5, repeats = 5)
modelo1 <- train(deslocamento ~ dist_aberta, data= disco, method= "glm", family= binomial, trControl=train_control)
print(modelo1)

modelo2 <- train(deslocamento ~ dist_fechada, data= disco, method= "glm", family= binomial, trControl=train_control)
print(modelo2)

modelo3 <- train(deslocamento ~ dist_aberta + dist_fechada, data= disco, method= "glm", family= binomial, trControl=train_control)
print(modelo3)
