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

# Preparar los datos de tiempo
library(lubridate)

# Eliminar datos de mes y año con valor 0
ca11 <- filter(ca10, (ANNOH != 0 & MESH != 0 & DIAH != 0))
# Unir datos de año, mes y día de ocurrencia
ca11_date <- unite(ca11, fecha, ANNOH:MESH, sep = "-", remove = FALSE)
ca11_date <- unite(ca11_date, Fecha, fecha:DIAH, na.rm = TRUE, sep = "-", remove = FALSE)
# Convertir columna a tipo "Date"
ca11_date$Fecha <- as.Date(ca11_date$Fecha)

ca11_date %>%
  count(fecha) %>%
  filter(n >= 2500) %>%
  arrange(desc(n)) -> ca11_date1

ggplot(ca11_date1) + 
  aes(fecha, weight = n) +
  geom_bar()
  
summarise(fecha, total = n()) %>%
  arrange(desc(total)) 

ggplot(ca11_date, aes(Fecha)) +
  scale_x_date(breaks = seq(as.Date("1958-08-07"), as.Date("2018-08-07"), "4 years")) +
  geom_bar()

ggplot(ca11_date) +
  aes(x = fecha) +
  geom_bar(fill = "#0c4c8a") +
#  scale_x_date(breaks = "4 years") +
  theme_hc()


ca15_date1 <- filter(ca15_date, !is.na(Fecha1))

ggplot(ca15_date1, aes(Fecha1)) +
  geom_bar() +
  #geom_vline(xintercept=vic11_date$Fecha[4],linetype=4) +
  scale_x_date(breaks = seq(as.Date("1958-08-07"), as.Date("2018-08-07"), "4 years")) +
  ylim(0, 160) +
  theme_fivethirtyeight()

ggplot(ca15_date1) +
  aes(x = Fecha1) +
  geom_histogram(bins = 61L, fill = "#00a8e6") +
  scale_x_date(breaks = seq(as.Date("1958-08-07"), as.Date("2018-08-07"), "4 years")) +
  theme_minimal()

ggplot(ca15_date1) +
  aes(x = Fecha1) +
  geom_density(adjust = 1L, fill = "#0c4c8a") +
  scale_x_date(breaks = seq(as.Date("1958-08-07"), as.Date("2018-08-07"), "4 years")) +
  theme_minimal()


ca15_date1 %>%
  filter(Fecha1 >= "2000-01-01" & Fecha1 <= "2009-12-31") %>%
  ggplot() +
  aes(x = Fecha1) +
  geom_bar(fill = "#0c4c8a") +
  theme_minimal()

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

# Filtrar registros únicos de víctimas y repetidos eliminados por Id:

vic11 <- distinct(vic10, Id, .keep_all = TRUE)
vic12 <- vic10[duplicated(vic10$Id), ]

# Filtrar registros repetidos en total para análisis:
# vic_rep <- vic10[duplicated(vic10$Id) | duplicated(vic10$Id, fromLast=TRUE), ]

# Preparar los datos de tiempo
library(lubridate)

# Eliminar datos de mes y año con valor 0
vic13 <- filter(vic11, (ANNOH != 0 & MESH != 0 & DIAH != 0))
# Unir datos de año, mes y día de ocurrencia
vic13_date <- unite(vic13, fecha, ANNOH:MESH, sep = "-", remove = FALSE)
vic13_date <- unite(vic13_date, Fecha, fecha:DIAH, na.rm = TRUE, sep = "-", remove = FALSE)
# Convertir columna a tipo "Date"
vic13_date$Fecha <- as.Date(vic13_date$Fecha)


ggplot(vic13_date) +
  aes(x = Fecha) +
  geom_bar(fill = "#0c4c8a") +
  scale_x_date(breaks = seq(as.Date("1958-08-07"), as.Date("2018-08-07"), "4 years")) +
  ylim(0, 300) +
  theme_minimal()

group_data(vic13_date)

vic13_date %>%
  group_data(Fecha) %>%
  summarise(Fecha) %>%
  arrange(desc(total))


ggplot(vic11_date1, aes(Fecha2)) +
  geom_bar() +
  #geom_vline(xintercept=vic11_date$Fecha[4],linetype=4) +
  scale_x_date(breaks = seq(as.Date("1958-08-07"), as.Date("2018-08-07"), "4 years")) +
  ylim(0, 180)
  #theme_bw()




vic11_date <- myd(vic11_date$Fecha)


vic11_y <- filter(vic11, ANNOH != "0")

vic11t$Fecha2 <- paste(vic11t$MESH, vic11t$ANNOH)

vic12 <- as.Date(vic11t$Fecha2)

vic1$Fecha2 <- dmy(vic14$Fecha)



vic15 <- as.Date(vic14, vic14$Fecha, format = "%Y.%m")


vic14$ANNOH <- as_factor(vic14$ANNOH)

vic14$Fecha <- ymd(vic14$Fecha)

vic14$newdate2 <- as.Date.POSIXlt(vic14$ANNOH)

vic14$Fecha <- format(vic14$Fecha, "%Y-%b")


vic14$Fecha1 <- as.character(vic14$Fecha)

vic14$Fecha2 <- as.Date(vic14$Fecha1, "%Y-%m-%d")



ggplot(group_by(vic11, fecha)) +
  aes(fecha) + 
  geom_bar(fill = "blue") +
  scale_x_date(breaks = seq(as.Date("ago-1958"), as.Date("ago-2018"), "4 years")) +
  ylim(0, 150) +
  theme_wsj()


# Gráficos por casos

ggplot(subset(ca10, ANNOH != 0), aes(ANNOH)) + 
  geom_bar() +
  # Gráfico por décadas
  #scale_x_binned() +
  # Gráfico por periodo presidencial
  #scale_x_binned(breaks = seq(1958, 2018, 4)) +
  theme_wsj()

# Gráficos sobre total de víctimas

vic17 <- filter(vic14, !is.na(Fecha))

library(scales)

ggplot(group_by(vic17, Fecha)) +
  aes(Fecha) + 
  geom_bar(fill = "blue") +
  scale_x_date() +
  ylim(0, 150) +
  theme_wsj()

ggplot(group_by(vic14, ANNOH), aes(ANNOH)) + 
  geom_bar(fill = "blue") +
  scale_x_continuous() +
  theme_wsj()


filter(vic11, ANNOH != 0) %>%
  group_by(ANNOH) %>%
  summarise(total=n()) %>%
  arrange(desc(total))


ggplot(subset(vic14, ANNOH != 0), aes(ANNOH)) + 
  geom_bar(fill = "blue") +
  # Gráfico por décadas
  # scale_x_binned() +
  
  # Gráfico por periodo presidencial
  # scale_x_binned(breaks = seq(1958, 2018, 4)) +
  # scale_x_date(limits = as.Date(c("1958-01-01","2018-12-31"))) +
  # scale_x_date(breaks = ANNOH) +
  # Gráfico por año
  # scale_x_binned(breaks = c(1958, 1962, 1966, 1970, 1974, 1978, 1982, 1986, 1990, 1994, 1998, 2002, 2010, 2018)) +
  theme_wsj()

# Sumario de años con más víctimas

summarise(group_by(vic11, ANNOH), total=n()) %>%
  subset(ANNOH != 0) %>%
  arrange(desc(total))
