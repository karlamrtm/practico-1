#Correlaciones entre variables

load("C:/Users/hp/Desktop/Rstudio/practico-1/elsoc2016.rdata") #Cargar base de datos
pacman::p_load(haven,
               dplyr, # Manipulacion datos
               sjmisc, # Descriptivos
               sjPlot, # Tablas
               sjlabelled, #etiquetas
               kableExtra, #Tablas
               GGally, # Correlaciones
               corrplot,
               texreg) # Correlaciones

options(scipen = 999) # para desactivar notacion cientifica

load(file = "C:/Users/hp/Desktop/Rstudio/practico-1/elsoc2016.rdata")
dim(proc_data) # Dimensiones
names(proc_data) # Muestra los nombres de las variables de la base de datos
names(proc_datacor)
proc_datacor <- proc_data %>% select(conf_inmigr, pier_ident_chi, aumenta_desempleo, iden_clase, nivel_educacional, sexo, edad)%>%
  mutate_all(~(as.numeric(.)))

sjmisc::descr(proc_datacor,
              show = c("label","range", "mean", "sd", "NA.prc", "n")) %>%
  kable(.,"markdown")

M <- cor(proc_datacor, use = "complete.obs")
M

#Correlaciones 
sjPlot::tab_corr(proc_datacor, 
                 triangle = "lower")
sjPlot::tab_corr(proc_datacor, 
                 na.deletion = "pairwise", # espeficicamos tratamiento NA
                 triangle = "lower")
corrplot.mixed(M)

M2 <- cor(dplyr::select(proc_datacor, conf_inmigr, pier_ident_chi, aumenta_desempleo), use = "complete.obs")
corrplot.mixed(M2)

proc_datacor <- proc_datacor %>%
  rowwise() %>%
  mutate(prejuicio = sum(pier_ident_chi, aumenta_desempleo))

ggpairs(proc_datacor)

sjPlot::plot_scatter(proc_datacor, conf_inmigr, edad, sexo)

sjPlot::plot_scatter(proc_datacor, conf_inmigr, nivel_educacional)

sjPlot::plot_scatter(proc_datacor, conf_inmigr, pier_ident_chi, aumenta_desempleo)

sjPlot::tab_corr(proc_datacor, 
                 triangle = "lower")

sjPlot::tab_corr(proc_datacor, 
                 na.deletion = "pairwise", # espeficicamos tratamiento NA
                 triangle = "lower")

fit01<- lm(prejuicio~iden_clase,data=proc_datacor)
fit02<- lm(prejuicio~nivel_educacional ,data=proc_datacor)
fit03<- lm(prejuicio~sexo,data=proc_datacor)
fit04<- lm(prejuicio~edad,data=proc_datacor)
fit05<- lm(prejuicio~nivel_educacional+iden_clase,data=proc_datacor)
fit06<- lm(prejuicio~sexo+edad,data=proc_datacor)
fit07<- lm(prejuicio~sexo+edad+nivel_educacional+iden_clase, data=proc_datacor)

knitreg(list(fit01, fit02,fit03))
knitreg(list(fit01, fit02,fit03, fit04, fit05, fit06))
knitreg(list(fit01, fit02,fit03, fit04, fit05, fit06, fit07))

fit01<- lm(prejuicio~iden_clase,data=proc_datacor)
fit02<- lm(prejuicio~nivel_educacional ,data=proc_datacor)
fit03<- lm(prejuicio~sexo,data=proc_datacor)
fit04<- lm(prejuicio~edad,data=proc_datacor)
fit05<- lm(prejuicio~nivel_educacional+iden_clase,data=proc_datacor)
fit06<- lm(prejuicio~sexo+edad,data=proc_datacor)
