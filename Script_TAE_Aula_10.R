# a função glm() ajusta o modelo de regressão logistica
modelo_simples <- glm(resposta ~ difinib, data = inibina_1, family = binomial(link = "logit" ))

# A função summary() apresenta um resumo estatístico do modelo
resumo <- summary(modelo_simples)
print(resumo)
