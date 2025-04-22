##MODELOS ADITIVOS GENERALIZADOS

# instalação dos pacotes para modelos aditivos generalizados
install.packages("mgcv")
install.packages("gam")
library(mgcv)
library(gam)

#Ajuste da regressão linear múltipla pela função gam()
#mod0 é um modelo inicial
mod0 <- gam(vo2fcpico ~ NYHA + idade + altura + peso + fcrep + vo2rep, data = esforco2)
summary(mod0)

#Ajuste do modelo com  splines cúbicos
mod1 <- gam(vo2fcpico ~ NYHA + s(idade) + s(altura) + s(peso) + s(fcrep) + s(vo2rep), data = esforco2)
summary(mod1)

#Gráficos de dispersões
plot(mod1, se = TRUE)
plot(mod0, se = TRUE)

#Ajuste a seguir sugere que todas as variáveis preditoras 
#contribuem significativamente para explicar sua relação com a variável resposta
mod2 <- gam(vo2fcpico ~ NYHA + idade + s(altura) + peso + s(fcrep), data = esforco2)
summary(mod2)
plot(mod2, se = TRUE)

#Uma avaliação adicional pode ser realizada por meio de uma análise de resíduos 
#e de comparação dos valores observados e preditos. 
#Para essa finalidade, tem a função gam.check()
#gam.check(mod2)

#É possível comparar os modelos por meio de uma análise de desviância, 
#que pode ser obtida com a função anova() 
anova( mod0, mod1, mod2, test = "F")
