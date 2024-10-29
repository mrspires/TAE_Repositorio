
##CLASSIFICAÇÃO POR ÁRVORES##

#Instalação dos pacotes tree, partykit, rpart
install.packages("partykit")
install.packages("tree")
install.packages("rpart")
install.packages("rpart.plot")
library(tree)
library(rpart)
library(rpart.plot)
library(partykit)

#A função ctree() é uma função do pacote partykit em R, que é usada para ajustar árvores de classificação condicionais, 
#também conhecidas como árvores de classificação de árvores de regressão

modelo_arvore <- ctree(grupo ~ altfac + proffac, data= face)
modelo_arvore
plot(modelo_arvore)

#tabela de classificação real e predita por meio da árvore de classificação é obtida pela função predict()
pred_arvore <- predict(modelo_arvore, tipofacial)
table(pred_arvore, tipofacial$grupo)

#A função rpart() implementa um algoritmo de árvores de decisão chamado Recursive Partitioning and Regression Trees (Árvores de Regressão e Partição Recursiva),
#que é frequentemente usado para tarefas de classificação

lesaoobs <- rpart(LO3 ~ GLIC + SEXO + IDADE1 + DIAB + TRIG + IMC, data = coronarias, method = "class", xval = 20, minsplit = 10, cp = 0.005)
printcp(lesaoobs)

rpart.plot(lesaoobs, clip.right.labs = TRUE, under = FALSE, extra= 101, type=4)

#Gráfico que mostra o ajuste da arvore
plotcp(lesaoobs)

#Tabela das previsões 
table(coronarias$LO3, predict(lesaoobs, type= "class"))


#Poda da árvore original 
lesaoobspoda <- prune(lesaoobs, cp = 0.015, "CP", minsplit = 20, xval = 25)
rpart.plot(lesaoobspoda, clip.right.labs = TRUE, under = FALSE, extra= 101, type = 4)
rpart.rules(lesaoobspoda, cover= TRUE)

#Tabela das previsões após poda da árvore
table(coronarias$LO3, predict(lesaoobspoda, type= "class"))
