concentration_ratio <- function(x){
  p <- rowSums(c_ratio[, 2:5])
  q <- apply(c_ratio[, 2:5],1,max)
  r <- c_ratio[,6]
  cr1 <- (q/r)*100
  cr4 <- (p/r)*100
  ano <- c_ratio[, 1]
  tabela <- cbind(ano,cr1,cr4)
  niveis_mercado_cr1 <- ifelse(cr1<35,"Ausência de concentração", ifelse (cr1<50,"Baixa concentração", ifelse(cr1<65,"Concentração moderada", ifelse (cr1<75,"Alta concentração", "Altamente concentrado"))))
  niveis_mercado_cr4 <- ifelse(cr4<35,"Ausência de concentração", ifelse (cr4<50,"Baixa concentração", ifelse(cr4<65,"Concentração moderada", ifelse (cr4<75,"Alta concentração", "Altamente concentrado"))))

  print(cr1)
  print(cr4)

  tabela_CR <- cbind(ano,cr1,niveis_mercado_cr1, cr4, niveis_mercado_cr4)
  colnames(tabela_CR)[1] <- "Ano"
  colnames(tabela_CR)[2] <- "CR1(%)"
  colnames(tabela_CR)[3] <- "Níveis de mercado CR1 (%)"
  colnames(tabela_CR)[4] <- "CR4(%)"
  colnames(tabela_CR)[5] <- "Níveis de mercado CR4 (%)"

  write.table(tabela_CR, sep = ";", "CR1_&_CR4.csv", col.names = NA)

  #gráfico
  tabela_CR <- cbind(ano,cr1,niveis_mercado_cr1, cr4, niveis_mercado_cr4)
  tabela_CR <- as.data.frame(tabela_CR)
  tabela_CR$cr1 = as.numeric (levels(tabela_CR$cr1))[tabela_CR$cr1]
  tabela_CR$cr4 = as.numeric (levels(tabela_CR$cr4))[tabela_CR$cr4]
  tabela_CR$ano = as.numeric (levels(tabela_CR$ano))[tabela_CR$ano]

  ggplot(data=tabela_CR, aes(x=ano, y=cr1)) +
    geom_line(aes(color="CR1 (%)"), size=0.7, linetype=2)+
    lims(y=c(0,100))+
    labs(x = "Ano", y = "Razão de concentração")+
    scale_x_continuous(breaks=tabela_CR$ano) +
    #geom_line(aes(y = cr1, color="CR1"), size=0.7, linetype=2)+
    geom_line(aes(y = cr4, color="CR4 (%)"), size=0.7, linetype=2)+
    scale_colour_manual(values=c("CR1 (%)"='black',
                                 "CR4 (%)" = 'red'))+
    theme(plot.title = element_text(hjust = 0.5))+
    theme(legend.position="bottom")+
    theme(legend.title = element_blank())+
    theme(axis.text.x=element_text(angle=50, size=8, vjust=0.5, color = "black"))+
    guides(colour = guide_legend(override.aes = list(linetype=c(2,2)
                                                     , shape=c(NA,NA))))


}
