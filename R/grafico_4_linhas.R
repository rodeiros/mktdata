#Função para gráfico de 4 linhas


grafico_4_linhas <- function(x){
  grafico <-
    ggplot(data=elaborar_4_linhas, aes(x=ano, y=EUA)) +
    geom_line(aes(color="Estados Unidos"), size=0.7, linetype=2)+
    labs(x = "Ano", y = "Quantidade importada   (1.000 t)")+
    scale_y_continuous(breaks=seq(0.0, 12, 2))+
    scale_x_continuous(breaks=elaborar_4_linhas$ano) +
    geom_line(aes(y = Bolívia, color="Bolívia"), size=0.7, linetype=2)+
    geom_line(aes(y = China.HK, color="China, HK"), size=0.7, linetype=2)+
    geom_line(aes(y = Peru, color="Peru"), size=0.7, linetype=2)+
    scale_colour_manual(values=c("Estados Unidos"='black',
                                 "Bolívia" = 'red', "China, HK"="blue", "Peru"="green4"))+
    theme(plot.title = element_blank())+
    theme(legend.position="bottom")+
    theme(legend.title = element_blank())+
    theme(axis.text.x=element_text(angle=50, size=8, vjust=0.5, color = "black"))+
    guides(colour = guide_legend(override.aes = list(linetype=c(2,2,2,2)
                                                     , shape=c(NA,NA,NA,NA))))

  print(grafico)
}
