##ALGORITMOS DE SUPORTE VETORIAL##
##CLASSIFICADOR DE MARGEM MÁXIMA E FLEXIVEL##

#Instalação do pacote para utilizar as funções svm(), tune()
install.packages("e1071")
library(e1071)


#classificador por margem flexivel usando a função tune.svm
# função tune.svm() é uma função do pacote e1071 em R, que é usada para ajustar os hiperparâmetros de um 
#modelo de Support Vector Machine (SVM) por meio de validação cruzada.
escolhaparam <- tune.svm(grupo ~ altfac + proffac, data = face, gamma = 2^(-2:2), cost = 2^2:5, na.action(na.omit(c(1, NA))))
summary(escolhaparam)

#funções svm() e summary() geram o resultado de classificador de margem flexivel
svm.model <- svm(grupo ~ altfac + proffac, data = face, kernel = "linear",type="C-classification", cost = 4)
summary(svm.model)

#Matriz de confusão com a previsão do modelo
svm.pred <- predict(svm.model, face)
table(pred = svm.pred, true = face$grupo)

#gráfico do classificador de margem flexível
plot(svm.model, face, proffac ~ altfac, svSymbol = 4, dataSymbol = 4, cex.lab=1.8, main="", color.palette= terrain.colors)


