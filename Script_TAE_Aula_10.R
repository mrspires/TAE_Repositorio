# Tabela para as duas variveis de qualidade e uma de quantidade
tabela <- with(milsa, ftable(Regiao, Est.civil, Inst))
prop.table(tabela)

# Medidas descritivas para múltiplas variáveis
# Funçao aggregate é usada para agrupar dados pela combinação das categorias de duas ou mais variáveis qualitativas
resumo_salario <- aggregate(Salario ~ Est.civil + Inst, data = milsa, FUN = summary)
print(resumo_salario)

# Gráfico a ser apresentado é o Boxplot pois queremos comparar as estatísticas da variável Salario nas categorias da variável Inst
boxplot(Salario ~ Inst * Est.civil, data=milsa, main = "Salarios", xlab = "Nível de Instrução x Estado Civil")

#Coeficiente de correlação das variáveis quantitativas e qualitativas ordinais
with(milsa, cor(Anos, Salario, method = "pearson"))
with(milsa, cor(Salario, Funcionario, method = "spearman"))
