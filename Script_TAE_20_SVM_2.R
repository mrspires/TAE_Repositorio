##ALGORITMOS SUPORTE VETORIAL##
##CLASSIFICADOR DE MARGEM NÃO LINEAR##

#Instalação do pacote para utilizar as funções svm(), tune()
install.packages("e1071")
library(e1071)


#classificador por margem não linear usando a função tune.svm
# função tune.svm() é uma função do pacote e1071 em R, que é usada para ajustar os hiperparâmetros de um 
#modelo de Support Vector Machine (SVM) por meio de validação cruzada.
escolhaparam <- tune.svm(grupo ~ altfac + proffac, data = face, kernel= "polynomial", degree = 3, gamma = 2^(-1:2), cost = 2^2:6)
summary(escolhaparam)

#funções svm() e summary() geram o resultado de classificador de margem não linear
svm.modelo <- svm(grupo ~ altfac + proffac, data = face, kernel = "polynomial", type="C-classification", degree= 3, gamma= 1,cost = 4, coefO=1,scale= FALSE)
summary(svm.modelo)

#Matriz de confusão com a previsão do modelo
svm.pred <- predict(svm.modelo, face)
table(pred =svm.pred, face$grupo)

#gráfico do classificador de margem não linear
plot(svm.modelo, face, proffac ~ altfac, svSymbol = 4, dataSymbol = 4, cex.lab=1.8, main="", color.palette= terrain.colors)


#Regressão por algoritmos de suporte vetorial
reg_modelo <- svm(distancia ~idade, data= distancia, type= "eps-regression", kernel = "linear", scale = FALSE)
summary(reg_modelo)
coef(reg_modelo)


reg_modelo1 <- svm(distancia ~idade, data= distancia,type= "eps-regression", kernel = "radial", degree= 5, cost =4, gamma=0.5, epsilon= 1.0)
summary(reg_modelo1)
