# Cargar librerias necesarias para el proyecto
library(readr)
library(tidyverse)
library(rio)
library(readxl)
library(gganimate)
library(ggthemes)

# Importar archivos de casos y víctimas y cambiar tipos de datos en columnas con errores

# Acciones bélicas
CasosAB <- read_excel("rawd/CasosAB.xlsx", 
                      col_types = c("numeric", "text", "numeric", 
                                    "numeric", "numeric", "text", "text", 
                                    "text", "text", "text", "text", "text", 
                                    "text", "text", "text", "text", "text", 
                                    "text", "numeric", "text", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "text", "text"))
VictimasAB <- read_excel("rawd/VictimasAB.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "text", "text", 
                                       "text", "text", "text", "text", "text", 
                                       "text", "text", "text", "text", "text"))

# Ataques a poblados
CasosAP <- read_excel("rawd/CasosAP.xlsx")
VictimasAP <- read_excel("rawd/VictimasAP.xlsx")

# Asesinatos selectivos
CasosAS <- read_excel("rawd/CasosAS.xlsx", 
                      col_types = c("numeric", "text", "numeric", 
                                    "numeric", "numeric", "text", "text", 
                                    "text", "text", "text", "text", "text", 
                                    "text", "text", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "text", "text", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "text"))

VictimasAS <- read_excel("rawd/VictimasAS.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "text", "text", 
                                       "text", "text", "text", "text", "text", 
                                       "text", "text", "skip", "text", "text", 
                                       "text"))

# Atentados terroristas
CasosAT <- read_excel("rawd/CasosAT.xlsx")
VictimasAT <- read_excel("rawd/VictimasAT.xlsx")

# Daños a bienes civiles
CasosDB <- read_excel("rawd/CasosDB.xlsx", 
                      col_types = c("numeric", "text", "numeric", 
                                    "numeric", "numeric", "text", "text", 
                                    "text", "text", "text", "text", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "text", "text", "text", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "text", "text", 
                                    "numeric", "text"))
VictimasDB <- read_excel("rawd/VictimasDB.xlsx")

# Desapariciones forzadas
CasosDF <- read_excel("rawd/CasosDF.xlsx")
VictimasDF <- read_excel("rawd/VictimasDF.xlsx")

# Masacres
CasosMA <- read_excel("rawd/CasosMA.xlsx")
VictimasMA <- read_excel("rawd/VictimasMA.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "text", "text", 
                                       "text", "text", "text", "text", "text", 
                                       "text", "text", "text", "text", "text", 
                                       "text"))

# Reclutamientos y utilización de menores
CasosRU <- read_excel("rawd/CasosRU.xlsx", 
                      col_types = c("numeric", "text", "numeric", 
                                    "numeric", "numeric", "text", "text", 
                                    "text", "text", "text", "text", "text", 
                                    "text", "text", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "text", "text", "numeric", 
                                    "text"))
VictimasRU <- read_excel("rawd/VictimasRU.xlsx")

# Secuestros
CasosSE <- read_excel("rawd/CasosSE.xlsx")
VictimasSE <- read_excel("rawd/VictimasSE.xlsx")

# Violencias sexuales
CasoVSI <- read_excel("rawd/CasoVSI.xlsx", 
                      col_types = c("numeric", "text", "numeric", 
                                    "numeric", "numeric", "text", "text", 
                                    "text", "text", "text", "text", "text", 
                                    "text", "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "text", "text", "numeric", "text"))
VictimasVS <- read_excel("rawd/VictimasVS.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "text", "text", 
                                       "text", "text", "text", "text", "text", 
                                       "text", "text", "text", "text", "text", 
                                       "text", "text"))

# Eventos por minas
CasosMI <- read_excel("rawd/CasosMI.xlsx", 
                      col_types = c("numeric", "text", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "text", "text", "text", "text", "text", 
                                    "text", "text", "text", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "text", "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "text"))
VictimasMI <- read_excel("rawd/VictimasMI.xlsx")

