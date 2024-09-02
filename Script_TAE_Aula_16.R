# instalação dos pacotes para modelos aditivos generalizados
install.packages("mgcv")
library(mgcv)

install.packages("gam")
library(gam)

#Ajuste da regressão linear múltipla pela função gam()
#mod0 é um modelo inicial
mod0 <- gam(vo2fcpico ~ NYHA + idade + altura + peso + fcrep + vo2rep, data = esforco2)

#Ajuste do modelo com  splines cúbicos
mod1 <- gam(vo2fcpico ~ NYHA + s(idade) + s(altura) + s(peso) + s(fcrep) + s(vo2rep), data = esforco2)

#Gráficos de dispersões
plot(mod1, se = TRUE)

#Ajuste a sguir sugere que todas as variáveis preditoras 
#contribuem significativamente para explicar sua relação com a variável resposta
mod2 <- gam(vo2fcpico ~ NYHA + idade + s(altura) + peso + s(fcrep), data = esforco2)
summary(mod2)

#Uma avaliação adicional pode ser realizada por meio de uma análise de resíduos e de comparação dos valores observados e preditos. 
#Para essa finalidade, tem a função gam.check()
gam.check(mod2)

#É possível comparar os modelos por meio de uma análise de desviância, que pode ser obtida com a função anova() 
anova( mod0, mod1, mod2, test = "F").

