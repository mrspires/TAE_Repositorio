# CLASSIFICAÇÃO PELA ANÁLISE DISCRIMINANTE LINEAR

#Instalação do pacote MASS
install.packages("MASS")
library(MASS)

#o coeficiente da função discriminante por meio da função lda() do pacote MASS.
coef_disc <- lda(inibina_1$resposta ~ inibina_1$difinib, data= inibina_1)
print(coef_disc)

#tabela relacionando a classificação predita com os valores reais da variável resposta
# é obtida por meio da função predict()
predito <- predict(coef_disc)
table(predito$class, inibina_1$resposta)

# a função glm() ajusta o modelo de regressão logistica
regressao <- glm(resposta ~ difinib, data = inibina_1, family = binomial(link = "logit" ))

# Fazer previsões com base no modelo ajustado da regressão logistica
preditoR <- predict(regressao, type = "response")

# Converter as previsões em classes binárias (0 ou 1) com base em um ponto de corte
Resposta <- ifelse(preditoR > 0.5, 1, 0)
table(Resposta, inibina_1$resposta)
