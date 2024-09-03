#Medidas de resumo
summary(ceagfgv$salario)
summary(ceagfgv$anosformado)


#Medidas de variabilidade
var(ceagfgv$salario)
sd(ceagfgv$salario)
Amplitude <- (3425-1800)
print(Amplitude)

var(ceagfgv$anosformado)
sd(ceagfgv$anosformado)

#Medidas de forma
#Para obter os coeficientes das medidas de forma, assimetria e curtose, deve instalar o pacote e1071
install.packages("e1071")
library(e1071)

coeficiente_assimetria <- skewness(ceagfgv$salario)
print(coeficiente_assimetria)
coeficiente_curtose <- kurtosis(ceagfgv$salario)
print(coeficiente_curtose)
