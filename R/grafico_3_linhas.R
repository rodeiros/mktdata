#Função para gráfico de 3 linhas


grafico_3_linhas <- function(x){
  grafico <-
    ggplot(data=elaborar_3_linhas, aes(x=elaborar_3_linhas$ano, y=elaborar_3_linhas$total)) +
    geom_line(aes(color="Total (com casca + sem casca)"), size=0.7, linetype=2)+
    geom_line(aes(y = com.casca, color="Castanha com casca"), size=0.7, linetype=2)+
    geom_line(aes(y = sem.casca, color="Castanha sem casca"), size=0.7, linetype=2)+
    lims(y=c(0,25))+
    labs(x = "Ano", y = "Quantidade exportada   (1.000 t)")+
    scale_x_continuous(breaks=elaborar_3_linhas$ano) +

    scale_colour_manual(values=c("Total (com casca + sem casca)"='black',
                                 "Castanha com casca" = 'red', "Castanha sem casca"="blue"))+
    theme(plot.title = element_blank())+
    theme(legend.position="bottom")+
    theme(legend.title = element_blank())+
    theme(axis.text.x=element_text(angle=50, size=8, vjust=0.5, color = "black"))+
    guides(colour = guide_legend(override.aes = list(linetype=c(2,2,2)
                                                     , shape=c(NA,NA,NA))))

  print(grafico)

}
