#Função para taxa de crescimento (Pode ser com casca ou sem casca. Dependerá da entrada de dados)

#16 pontos no gráfico:

taxa_crescimento_16P <- function(x){
  glm <- list()
  for(i in names(elaborar_taxa_cresc_16P)[-1]){
    glm[[i]] <- lm(get(i) ~ ano, elaborar_taxa_cresc_16P)
  }

  lista1 <- do.call("rbind", lapply(glm, '[', 1))

  lista2<- do.call("rbind", lapply(lista1, '[', 2))

  taxa<- ((exp(lista2))-1)*100


  df_taxa <- cbind(taxa, descrição = names(glm))

  df_taxa <- df_taxa[, c(2,1,-0)]

  df_taxa2 <- as.data.frame(df_taxa[ ,c(2)])

  df_taxa2 [1:16,1]
  df_taxa2$nova_coluna <- df_taxa2 [1:16,1]

  df_taxa2 [17:32,1]
  df_taxa2$nova_coluna2 <- df_taxa2 [17:32,1]

  df_taxa2 <- df_taxa2[, -1]
  df_taxa2 <- df_taxa2[-c(17:32),]

  colnames(df_taxa2)[1] <- "tx_qtd"
  colnames(df_taxa2)[2] <- "tx_preco"

  pais <- c("País 1 (Período 1)", "País 1 (Período 2)",	"País 1 (Período 3)",	"País 1 (Período 4)", "País 2 (Período 1)", "País 2 (Período 2)",	"País 2 (Período 3)",	"País 2 (Período 4)", "País 3 (Período 1)", "País 3 (Período 2)",	"País 3 (Período 3)",	"País 3 (Período 4)", "País 4 (Período 1)", "País 4 (Período 2)",	"País 4 (Período 3)",	"País 4 (Período 4)")

  df_taxa2 <- cbind(df_taxa2[1], df_taxa2[2], pais)

  print(df_taxa2)
  write.table(df_taxa2, sep = ";", "taxa_crescimento.csv", col.names = NA)

  #gráfico
  df_taxa2$tx_qtd = as.numeric (levels(df_taxa2$tx_qtd))[df_taxa2$tx_qtd]
  df_taxa2$tx_preco= as.numeric (levels(df_taxa2$tx_preco))[df_taxa2$tx_preco]

  ggplot(df_taxa2, aes(x=tx_preco, y=tx_qtd, color=pais, shape=pais)) +
    geom_point(size=4.5)+
    geom_vline(xintercept = 0) + geom_hline(yintercept = 0)+

    #limites dos dados
    lims(x=c(-100,100),y=c(-130,130))+
    labs(title = "Taxa de crescimento de castanha com casca  \n - principais importadores (1998-2017)", x = "Taxa de crescimento em preço (%)", y = "Taxa de crescimento em quantidade (%)")+
    theme(plot.title = element_text(hjust = 0.5))+
    theme(legend.title=element_blank())+

    #Aumentar fonte dos eixos x e y
    theme(axis.text = element_text(size=15))+
    theme(axis.title = element_text(size=15))+

    #Aumentar fonte da legenda
    theme(legend.text = element_text(size=12)) +

    scale_shape_manual(values = c(17,16,9, 15,1, 12, 18, 8, 7,3,4, 0, 10, 14, 13, 20))

}
