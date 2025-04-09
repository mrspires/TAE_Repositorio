##ANÁLISE DE REGRESSÃO LOGÍSTICA


# Converter vírgula para ponto e transformar em numérico
inibina_1$difinib <- as.numeric(gsub(",", ".", inibina_1$difinib))

#a função glm() ajusta o modelo de regressão logistica
modelo_simples <- glm(resposta ~ difinib, data = inibina_1, family = binomial(link = "logit" ))

# A função summary() apresenta um resumo estatístico do modelo
resumo <- summary(modelo_simples)
print(resumo)

# Fazer previsões com base no modelo ajustado da regressão logistica
preditoR <- predict(modelo_simples, type = "response")

# Converter as previsões em classes binárias (0 ou 1) com base em um ponto de corte
Resposta <- ifelse(preditoR > 0.5, 1, 0)

# Gera a matriz de confusão
table(Resposta, inibina_1$resposta)
