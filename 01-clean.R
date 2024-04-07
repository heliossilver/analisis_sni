
pacman::p_load("vroom", "dplyr")

#leer data

la_data <- vroom(file = "data/data_original.csv")

#nos quedamos con dr. o dra.

data_filtrada <- la_data %>% 
  filter(nobilis %in% c("DR.","DRA."))

#creamos un directorio de resultados

if (!dir.exists("results")) {
  dir.create("results")
}

#guardar
write.csv(x = data_filtrada, file = "results/limpia.csv", row.names = FALSE)

#calcular la proporcion de DR y DRA que pierden SNI

data_resumen <- data_filtrada %>% 
  filter(cambio == "perdio SNI") %>% 
  group_by(nobilis) %>% 
  summarise(totales = sum(miembros))

#guardar
write.csv(x = data_resumen, file = "results/resumen.csv", row.names = FALSE)


#TO-DOs
#Calcular el % de DR. y DRA. que pierde SNI

