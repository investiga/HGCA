# Unir todos los registros de casos y víctimas para conteo y graficación global

# Casos
ca1 <- merge(CasosAB, CasosAP, all = TRUE)
ca2 <- merge(ca1, CasosAS, all = TRUE)
ca3 <- merge(ca2, CasosAT, all = TRUE)
ca4 <- merge(ca3, CasosDB, all = TRUE)
ca5 <- merge(ca4, CasosDF, all = TRUE)
ca6 <- merge(ca5, CasosMA, all = TRUE)
ca7 <- merge(ca6, CasosMI, all = TRUE)
ca8 <- merge(ca7, CasosRU, all = TRUE)
ca9 <- merge(ca8, CasosSE, all = TRUE)
ca10 <- merge(ca9, CasoVSI, all = TRUE)

ggplot(subset(ca10, ANNOH != 0), aes(ANNOH)) + 
  geom_bar() +
  # Gráfico por décadas
  #scale_x_binned() +
  # Gráfico por periodo presidencial
  #scale_x_binned(breaks = seq(1958, 2018, 4)) +
  theme_wsj()

# Víctimas

vic1 <- merge(VictimasAB, VictimasAP, all = TRUE)
vic2 <- merge(vic1, VictimasAS, all = TRUE)
vic3 <- merge(vic2, VictimasAT, all = TRUE)
vic4 <- merge(vic3, VictimasDB, all = TRUE)
vic5 <- merge(vic4, VictimasDF, all = TRUE)
vic6 <- merge(vic5, VictimasMA, all = TRUE)
vic7 <- merge(vic6, VictimasMI, all = TRUE)
vic8 <- merge(vic7, VictimasRU, all = TRUE)
vic9 <- merge(vic8, VictimasSE, all = TRUE)
vic10 <- merge(vic9, VictimasVS, all = TRUE)

ggplot(subset(vic10, ANNOH != 0), aes(ANNOH)) + 
  geom_bar() +
  # Gráfico por décadas
  #scale_x_binned() +
  # Gráfico por periodo presidencial
  #scale_x_binned(breaks = seq(1958, 2018, 4)) +
  theme_wsj()
