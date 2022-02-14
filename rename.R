library(here)

##### Please modify the following section as required ##########
################################################################

## Define directory where raw (input) and tidy (output) data are
data_raw <- "data/raw"
data_tidy <- "data/tidy"

## Define the file extension of the files you are targeting 
file_target_pattern <- ".csv"

## Define common and species names equivalences
name_equivalences = c("Common Silverbiddy" = "Gerres subfasciatus",
                      "Common Toadfish" = "Tetractenos hamiltoni",
                      "Sea Mullet" = "Mugil cephalus",
                      "YellowfinBream" = "Acanthopagrus australis")



##### Once the above section is customize you can run the section below ##########
##### Please double check that common names are spelled as in the raw files ######
##################################################################################

## Retrive all .csv file in the raw directory
files_list <- list.files(path = here::here("data/raw"), pattern = file_target_pattern, full.names = TRUE, recursive = TRUE)

## Read one file at the time, change common name occurrences to species names and save it into data/tidy
for (i in 1:length(files_list)){
  
  ## Read file
  df_temp = read.csv(files_list[i], header=TRUE)
  
  ## Change name
  df_temp$speciesName <- as.character(name_equivalences[df_temp$speciesName])
  
  ## Create the path name to the output file
  path_out_name = gsub(data_raw, data_tidy, files_list[i])
  
  ## Save file
  write.csv(df_temp, file = path_out_name, row.names = FALSE)

  ## Print which files was processed
  print(paste0("Saving file in: ", path_out_name))
  
  ## Clean the environment from temporal variables
  rm(list = c('df_temp', 'path_out_name', 'i'))
  gc()
}

## End of script