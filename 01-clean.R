
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

write.csv(x = data_filtrada, file = "results/limpia.csv", row.names = FALSE)
