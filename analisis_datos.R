##Practico 4##
pacman::p_load(sjlabelled,
               dplyr, #Manipulacion de datos
               stargazer, #Tablas
               sjmisc, # Tablas
               summarytools, # Tablas
               kableExtra, #Tablas
               sjPlot, #Tablas y gráficos
               corrplot, # Correlaciones
               sessioninfo, # Información de la sesión de trabajo
               ggplot2) # Para la mayoría de los gráficos

load("C:/Users/hp/Desktop/Rstudio/practico-1/elsoc2016.rdata") #Cargar base de datos
elsoc2016 <- read_dta("elsoc2016.dta")
names(proc_data) # Muestra los nombres de las variables de la base de datos
dim(proc_data) # Dimensiones

stargazer(proc_data,type = "text")

sjmisc::descr(proc_data)
sjmisc::descr(proc_data,
              show = c("label","range", "mean", "sd", "NA.prc", "n"))%>%
  kable(.,"markdown")

summarytools::dfSummary(proc_data, plain.ascii = FALSE)
view(dfSummary(proc_data, headings=FALSE))

#Para esta entrega eliminamos los casos perdidos por su cantidad
ggplot()
ggplot(proc_data, aes(x = conf_inmigr))

proc_data %>% ggplot(aes(x = conf_inmigr)) + 
  geom_bar()

proc_data %>% ggplot(aes(x = conf_inmigr)) + 
  geom_bar(fill = "coral")

proc_data %>% ggplot(aes(x = conf_inmigr)) + 
  geom_bar(fill = "coral")+
  labs(title = "Confianza en inmigrantes en el país",
       x = "Niveles de confianza en inmigrantes",
       y = "Grados de confianza")

# Crear el gráfico usando ggplot2#
graph1 <- proc_data %>% ggplot(aes(x = conf_inmigr)) + 
  geom_bar(fill = "coral")+
  labs(title = "Confianza en inmigrantes en el país",
       x = "Niveles de confianza en inmigrantes",
       y = "Grados de confianza") +
  theme_bw()

graph1
#Explicar que significa quee los balores de 2 sean los más elevados en cuanto a la confianza en inmigrantes en el país, sacar porcentaje y presentar en la interpretación de datos.
#Explicar que significa cada valor asociado a los grados de confianza y como ello se asocia a la percepción de la migración con la llegada de inmigrantes Hai/Per/Ven"

# y lo podemos guardar:
ggsave(graph1, file="files/img/graph1.png")
ggsave(graph1, file="output/graphs/graph1.png")
1
#Exploración de asociación entre variables categoricas# 
#podemos guardar las tablas de contingencia con sjt.xtab????
#sjt.xtab(proc_data$conf_inmigr, proc_data$pier_ident_chi, encoding = "UTF-8")
#sjt.xtab(proc_data$conf_inmigr, proc_data$aumenta_desempleo, encoding = "UTF-8")
#sjt.xtab(proc_data$conf_inmigr, proc_data$iden_clase, encoding = "UTF-8")
#sjt.xtab(proc_data$conf_inmigr, proc_data$nivel_educacional, encoding = "UTF-8")
#sjt.xtab(proc_data$conf_inmigr, proc_data$sexo, encoding = "UTF-8")
#sjt.xtab(proc_data$conf_inmigr, proc_data$edad, encoding = "UTF-8")

sjt.xtab(proc_data$conf_inmigr, proc_data$pier_ident_chi)
sjt.xtab(proc_data$conf_inmigr, proc_data$pier_ident_chi,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$conf_inmigr, proc_data$aumenta_desempleo)
sjt.xtab(proc_data$conf_inmigr, proc_data$aumenta_desempleo,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$conf_inmigr, proc_data$iden_clase)
sjt.xtab(proc_data$conf_inmigr, proc_data$iden_clase,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$conf_inmigr, proc_data$nivel_educacional)
sjt.xtab(proc_data$conf_inmigr, proc_data$nivel_educacional,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$conf_inmigr, proc_data$sexo)
sjt.xtab(proc_data$conf_inmigr, proc_data$sexo,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$pier_ident_chi, proc_data$sexo)
sjt.xtab(proc_data$pier_ident_chi, proc_data$sexo,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$aumenta_desempleo, proc_data$sexo)
sjt.xtab(proc_data$aumenta_desempleo, proc_data$sexo,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$conf_inmigr, proc_data$edad)
sjt.xtab(proc_data$conf_inmigr, proc_data$edad,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$pier_ident_chi, proc_data$edad)
sjt.xtab(proc_data$pier_ident_chi, proc_data$edad,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$aumenta_desempleo, proc_data$edad)
sjt.xtab(proc_data$aumenta_desempleo, proc_data$edad,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$conf_inmigr, proc_data$edad_groups)
sjt.xtab(proc_data$conf_inmigr, proc_data$edad_groups,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$pier_ident_chi, proc_data$edad_groups)
sjt.xtab(proc_data$pier_ident_chi, proc_data$edad_groups,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

sjt.xtab(proc_data$aumenta_desempleo, proc_data$edad_groups)
sjt.xtab(proc_data$aumenta_desempleo, proc_data$edad_groups,
         show.col.prc=TRUE,
         show.summary=FALSE,
         encoding = "UTF-8")

tapply(proc_data$conf_inmigr, proc_data$iden_clase, mean)
tapply(proc_data$conf_inmigr, proc_data$pier_ident_chi, mean)
tapply(proc_data$conf_inmigr, proc_data$aumenta_desempleo, mean)
tapply(proc_data$conf_inmigr, proc_data$nivel_educacional, mean)
tapply(proc_data$conf_inmigr, proc_data$sexo, mean)
tapply(proc_data$conf_inmigr, proc_data$edad, mean)
tapply(proc_data$conf_inmigr, proc_data$edad_groups, mean)



graph2 <- sjPlot::plot_stackfrq(dplyr::select(proc_data, conf_inmigr,
                                              pier_ident_chi,
                                              aumenta_desempleo),
                                title = "Indicadores de confianza con la inmigración") +
  theme(legend.position="bottom")

graph2

# Guardamos
ggsave(graph2, file="files/img/graph2.png")
ggsave(graph2, file="output/graphs/graph2.png")

datos <- proc_data %>% group_by(iden_clase) %>% 
  summarise(promedio = mean(conf_inmigr, na.rm = TRUE))

ggplot(datos, aes(x =iden_clase, y = promedio)) +
  geom_point() +
  labs(x = "Identificación de clase social subjetiva", y = "Confianza en inmigrantes") +
  theme_minimal()

graph3 <- ggplot(proc_data, aes(x = as.numeric(iden_clase))) +
  geom_histogram(binwidth=0.5, colour="black", fill="coral") +
  theme_bw() +
  xlab("Identificación de clase social") +
  ylab("Cantidad")

frq(proc_data$iden_clase)
graph3 

# Guardamos
ggsave(graph3, file="files/img/graph3.png")
ggsave(graph3, file="output/graphs/graph3.png")

#Grafico 4
graph4 <- ggplot(proc_data, aes(x = as.numeric(edad))) +
  geom_histogram(binwidth=0.6, colour="black", fill="coral") +
  theme_bw() +
  xlab("Edad") +
  ylab("Cantidad")

graph4 

# Guardamos
ggsave(graph4, file="files/img/graph4.png")
ggsave(graph4, file="output/graphs/graph4.png")

str(proc_data$edad)
str(proc_data$conf_inmigr)
str(proc_data$pier_ident_chi)
str(proc_data$aumenta_desempleo)
str(proc_data$iden_clase)
str(proc_data$edad_groups)
str(proc_data$sexo)
str(proc_data$nivel_educacional)

datos1 <- proc_data %>% group_by(pier_ident_chi) %>% 
  summarise(promedio = mean(conf_inmigr, na.rm = TRUE))

ggplot(datos1, aes(x =pier_ident_chi, y = promedio)) +
  geom_point() +
  labs(x = "Chile pierde identidad", y = "Confianza en inmigrantes") +
  theme_minimal()

graph5 <- ggplot(proc_data, aes(x = as.numeric(pier_ident_chi))) +
  geom_histogram(binwidth=0.5, colour="black", fill="coral") +
  theme_bw() +
  xlab("Chile pierde identidad") +
  ylab("Grados de acuerdo con la afirmación")

graph5

# Guardamos
ggsave(graph5, file="files/img/graph5.png")
ggsave(graph5, file="output/graphs/graph5.png")

datos2 <- proc_data %>% group_by(aumenta_desempleo) %>% 
  summarise(promedio = mean(conf_inmigr, na.rm = TRUE))

ggplot(datos2, aes(x =aumenta_desempleo, y = promedio)) +
  geom_point() +
  labs(x = "Aumenta el desempleo con la llegada de inmigrantes", y = "Confianza en inmigrantes") +
  theme_minimal()

graph6 <- ggplot(proc_data, aes(x = as.numeric(aumenta_desempleo))) +
  geom_histogram(binwidth=0.5, colour="black", fill="coral") +
  theme_bw() +
  xlab("Aumenta el desempleo con la llegada de inmigrantes") +
  ylab("grados de acuerdo")

graph6

# Guardamos
ggsave(graph6, file="files/img/graph6.png")
ggsave(graph6, file="output/graphs/graph6.png")

datos3 <- proc_data %>% group_by(sexo) %>% 
  summarise(promedio = mean(conf_inmigr, na.rm = TRUE))

ggplot(datos3, aes(x =sexo, y = promedio)) +
  geom_point() +
  labs(x = "Sexo", y = "Confianza en inmigrantes") +
  theme_minimal()

graph7 <- ggplot(proc_data, aes(x = as.numeric(sexo))) +
  geom_histogram(binwidth=0.5, colour="black", fill="coral") +
  theme_bw() +
  xlab("Sexo") +
  ylab("grados de acuerdo")

graph7

# Guardamos
ggsave(graph7, file="files/img/graph7.png")
ggsave(graph7, file="output/graphs/graph7.png")

graph8 <- proc_data %>% ggplot(aes(x = conf_inmigr, fill = sexo)) + 
  geom_bar() +
  xlab("Confianza en inmigrantes") +
  ylab("Cantidad") + 
  labs(fill="Sexo")+
  scale_fill_discrete(labels = c('Hombre','Mujer'))

graph8

proc_data %>% ggplot(aes(x = conf_inmigr)) + 
  geom_bar() +
  xlab("Confianza en inmigrantes") +
  ylab("Niveles de confianza")+
  facet_wrap(~sexo)


datos4 <- proc_data %>% group_by(nivel_educacional, sexo) %>% 
  summarise(promedio = mean(conf_inmigr))

ggplot(datos4, aes(x =nivel_educacional, y = promedio)) +
  geom_point() +
  labs(x = "Nivel Educacional", y = "Confianza en inmigrantes") +
  theme_bw()+
  ylim(0, 12)+
  facet_wrap(~sexo)

ggplot(datos4, aes(x =sexo, y = promedio)) +
  geom_point() +
  labs(x = "Sexo", y = "Confianza en inmigrantes") +
  theme_bw()+
  ylim(0, 12)+
  facet_wrap(~nivel_educacional)

summary(proc_data$edad)
summary(proc_data$edad_groups)

datos5 <- proc_data %>% group_by(nivel_educacional, edad_groups) %>% 
  summarise(promedio = mean(conf_inmigr))

ggplot(datos5, aes(x =nivel_educacional, y = promedio)) +
  geom_point() +
  labs(x = "Nivel educacional", y = "Confianza en inmigrantes") +
  theme_bw()+
  ylim(0, 7)+
  facet_wrap(~edad_groups)

datos6 <- proc_data %>% group_by(nivel_educacional, sexo, edad_groups) %>% 
  summarise(promedio = mean(conf_inmigr))

sapply(datos6, class)
datos6$sexo_n <- as.numeric(datos6$sexo)

ggplot(datos6, aes(x =nivel_educacional, y = promedio, color=sexo_n)) +
  geom_point() +
  labs(x = "Nivel Educacional", y = "Confianza en inmigrantes") +
  theme_bw()+
  ylim(0, 7)+
  facet_wrap(~edad_groups)

ggplot(datos6, aes(x =nivel_educacional, y = promedio, color=sexo_n)) +
  geom_point() +
  labs(x = "Nivel Educacional", y = "Confianza en inmigrantes") +
  theme_bw()+
  ylim(0, 7)+
  facet_wrap(~edad_groups)

ggplot(datos6, aes(x =nivel_educacional, y = promedio, color=sexo_n)) +
  geom_point() +
  labs(x = "Nivel Educacional", y = "Confianza en inmigrantes") +
  theme_bw() +
  ylim(0, 7) +
  facet_wrap(~edad_groups) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

graph9 <- ggplot(datos6, aes(x =nivel_educacional, y = promedio, color=sexo_n)) +
  geom_point() +
  labs(x = "Nivel Educacional", y = "Confianza en inmigrantes") +
  theme_bw() +
  ylim(0, 7) +
  facet_wrap(~edad_groups) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

graph9
ggsave(graph9, file="files/img/graph9.png")
ggsave(graph9, file="output/graphs/graph9.png")

datos7 <- proc_data %>% group_by(pier_ident_chi, sexo, edad_groups) %>% 
  summarise(promedio = mean(conf_inmigr))

sapply(datos7, class)
datos7$sexo_n <- as.numeric(datos7$sexo)
datos7$pier_ident_chi_n <- as.numeric(datos7$pier_ident_chi)

ggplot(datos7, aes(x =pier_ident_chi, y = promedio, color=sexo_n)) +
  geom_point() +
  labs(x = "Chile pierde identidad con la llegada de inmigrantes", y = "Confianza en inmigrantes") +
  theme_bw() +
  ylim(0, 7) +
  facet_wrap(~edad_groups) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

graph10 <- ggplot(datos7, aes(x =pier_ident_chi_n, y = promedio, color=sexo_n)) +
  geom_point() +
  labs(x = "Chile pierde identidad con la llegada de inmigrantes", y = "Confianza en inmigrantes") +
  theme_bw() +
  ylim(0, 7) +
  facet_wrap(~edad_groups) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Corregir o eliminar#
graph10
ggsave(graph10, file="files/img/graph10.png")
ggsave(graph10, file="output/graphs/graph10.png")
