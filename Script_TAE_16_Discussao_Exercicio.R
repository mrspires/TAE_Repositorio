#DISCUSSÃO DAS TÉCNICAS LASSO, RIDGE, ELASTICNET E MODELOS ADITIVOS GENERALIZADOS

# Dados arquivo esforco3 variáveis a serem criadas:  Indice de Massa Corporal, IMC = Peso/(Altura/100)^2 - (a altura nos dados está em cm e na fórmula o cálculo é em metros)
# e Superficie Corporal, SC = sqrt(Altura*Peso/ 3600) ou ainda, fórmula de Du Bois, SC = 0.007184 * (Peso^0.425) * (Altura_cm^0.725)


esforco3$IMC <-  esforco3$peso/(esforco3$altura/100)^2
esforco3$SC <- sqrt(esforco3$altura*esforco3$peso/ 3600)
esforco3$SC2 <-  0.007184 * (esfoco3$peso^0.425) * (esfoco3$altura_cm^0.725)
