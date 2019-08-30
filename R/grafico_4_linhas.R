grafico_4_linhas <- function (x){
  grafico <-
    ggplot(data=grafico4, aes(x=ano, y=Bolívia)) +
    geom_line(aes(color="Bolívia"), size=0.7, linetype=2)+
    lims(y=c(0,60))+
    labs(x = "Ano", y = "Quantidade exportada   (1.000 t)")+
    scale_x_continuous(breaks=grafico4$ano) +
    geom_line(aes(y = Brasil, color="Brasil"), size=0.7, linetype=2)+
    geom_line(aes(y = Peru, color="Peru"), size=0.7, linetype=2)+
    geom_line(aes(y = Total, color="Total mundial"), size=0.7, linetype=2)+
    scale_colour_manual(values=c("Bolívia"='red',
                                 "Brasil" = 'blue', "Peru"="green4", "Total mundial"="black"))+
    theme(plot.title = element_blank())+
    theme(legend.position="bottom")+
    theme(legend.title = element_blank())+
    theme(axis.text.x=element_text(angle=50, size=8, vjust=0.5, color = "black"))+
    guides(colour = guide_legend(override.aes = list(linetype=c(2,2,2,2)
                                                     , shape=c(NA,NA,NA,NA))))

  print (grafico)

}
