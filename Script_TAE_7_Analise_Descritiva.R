## ANÁLISE DESCRITIVA DE UMA VARIÁVEL: MEDIDAS DE DISPERSÃO E FORMA  

#Pacote que será utilizado:
#Para obter os coeficientes das medidas de forma, assimetria e curtose, 
#deve instalar o pacote e1071
install.packages("e1071")
library(e1071)


#Medidas de posição
summary(ceagfgv$salario)
mediana_salario <- median(ceagfgv$salario)
print(mediana_salario)

summary(ceagfgv$anosformado)


#Medidas de dispersão (variabilidade)
var(ceagfgv$salario)
sd(ceagfgv$salario)
dQ_salario <- IQR(ceagfgv$salario)
print(dQ_salario)

var(ceagfgv$anosformado)
sd(ceagfgv$anosformado)
dQ_anosformado <- IQR(ceagfgv$anosformado)
print(dQ_anosformado)


#Medidas de forma
coef_assimetria_salario <- skewness(ceagfgv$salario)
print(coef_assimetria_salario)
coef_curtose_salario <- kurtosis(ceagfgv$salario)
print(coef_curtose_salario)

# histograma
hist(ceagfgv$salario)
