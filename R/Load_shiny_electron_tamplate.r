

require(utils)

Load_shiny_electron_tamplate = function(path=file.path(Sys.getenv("USERPROFILE"),"Desktop")) {

#---------------------------------------------------------------------------------------------------#
## I. Prepare Template [1/7] Download the "shiny-electron"-template for building standalone apps ####
#---------------------------------------------------------------------------------------------------#
  cat("#############", "\n")
  cat("[1/7] Download the 'shiny-electron'-template", "\n")
  cat("#############", "\n")

  temp <- tempfile() #Create temporaty file
  utils::download.file("https://github.com/SimonRess/Shiny-Electron/archive/refs/heads/main.zip",temp) #save repositories zip-file in temp
  utils::unzip(temp, exdir = path) # unzip
  repo =  utils::unzip(temp, exdir = path, list=TRUE)$Name[1] #get name of the unziped folder
  unlink(temp) # delete temporary file

  #Changing Working Directory to downloaded Repo (!IMPORTANT!)
  setwd(paste0(path,"/",repo))
  cat("Working Directory changed to:", paste0(path,"/",repo), "\n")
  cat("\n")

  return(repo)

}
