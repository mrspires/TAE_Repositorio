# EXERCICIO DA AULA 15  - MODELOS ADITIVOS GENERALIZADOS

# Dados arquivo esforco3 variáveis a serem criadas: IMC = Peso/(Altura/100)^2 - (a altura nos dados está em cm e na fórmula o cálculo é em metros)
# e Superficie Corporea = sqrt(Altura*Peso/ 3600)

esforco3$IMC <-  esforco3$peso/(esforco3$altura/100)^2
esforco3$SupCor <- sqrt(esforco3$altura*esforco3$peso/ 3600)

