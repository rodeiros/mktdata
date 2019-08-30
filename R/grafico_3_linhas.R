


grafico_3_linhas <- function(x){
  ggplot(data=grafico_linhas_ex, aes(x=grafico_linhas_ex[[1]], y=grafico_linhas_ex[[4]])) +
    geom_line(aes(color="Total (com casca + sem casca)"), size=0.7, linetype=2)+
    geom_line(aes(y = grafico_linhas_ex[[2]], color="Primeira variável"), size=0.7, linetype=2)+
    geom_line(aes(y = grafico_linhas_ex[[3]], color="Castanha sem casca"), size=0.7, linetype=2)+
    lims(y=c(0,25))+
    labs(title = "Exportações de Castanha do Brasil -\n  Brasil, Bolívia e Peru (1998-2017)", x = "Ano", y = "Quantidade exportada   (1.000 t)")+
    scale_x_continuous(breaks=grafico_linhas_ex[[1]]) +

    scale_colour_manual(values=c("Total (com casca + sem casca)"='black',
                                 "Primeira variável" = 'red', "Castanha sem casca"="blue"))+
    theme(plot.title = element_blank())+
    theme(legend.position="bottom")+
    theme(legend.title = element_blank())+
    theme(axis.text.x=element_text(angle=50, size=8, vjust=0.5, color = "black"))+
    guides(colour = guide_legend(override.aes = list(linetype=c(2,2,2)
                                                     , shape=c(NA,NA,NA))))

  #dev.print(pdf, "Exportações_castanha_pais-Brasil.pdf")
  print(grafico)
}
