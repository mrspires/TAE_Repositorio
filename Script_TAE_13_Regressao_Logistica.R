##ANÁLISE DE REGRESSÃO LOGÍSTICA

# Instalar e carregar pacote
install.packages("dplyr")
library(dplyr)


# Criar nova coluna com a diferença entre duas colunas
inibina <- inibina %>%
  mutate(difinib = inibpos - inibpre)

#Transformar os valores "positiva" em 1 e "negativa" em 0 dentro da coluna resposta_binaria
inibina <- inibina %>%
  mutate(resposta_binaria = ifelse(resposta == "positiva", 1,
                            ifelse(resposta == "negativa", 0, NA)))

#a função glm() ajusta o modelo de regressão logistica
modelo_simples <- glm(resposta_binaria ~ difinib, data = inibina, family = binomial(link = "logit" ))

# A função summary() apresenta um resumo estatístico do modelo
resumo <- summary(modelo_simples)
print(resumo)

# Fazer previsões com base no modelo ajustado da regressão logistica
preditoR <- predict(modelo_simples, type = "response")

# Converter as previsões em classes binárias (0 ou 1) com base em um ponto de corte
Resposta <- ifelse(preditoR > 0.5, 1, 0)

# Gera a matriz de confusão
table(Resposta, inibina$resposta_binaria)
