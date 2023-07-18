
Adjust_config = function(path=file.path(Sys.getenv("USERPROFILE"),"Desktop"),
                         repo="shinystandalone",
                         app.name="App Name",
                         app.description="App Description") {

#---------------------------------------------------------------------#
## II. Customize App [3/3]: Adjusting the configuration of the app ####
#---------------------------------------------------------------------#
  cat("#############", "\n")
  cat("II. Customize App [3/3]: Install all required R-packages", "\n")
  cat("#############", "\n")


  #Change Working Directory if not already correct
    if(normalizePath(getwd()) != normalizePath(paste0(path,"/",repo))){
      #Changing Working Directory to downloaded Repo (!IMPORTANT!)
      setwd(paste0(path,"/",repo))
      cat("Working Directory changed to:", paste0(path,"/",repo), "\n")
      cat("\n")
    }


  #Read Config-file (package.json) for App building
  file = readLines(paste0(getwd(),"/package.json"))
  #Change "name"
    file = gsub(pattern = "Shiny Electron App", replacement = app.name, x = file)
  #Change "version"
    #...
  #Change "description"
    file = gsub(pattern = "A minimal Electron application running Shiny Apps", replacement = app.description, x = file)
  #Change Output-folder
    file = gsub(pattern = "ElectronShinyAppWindows", replacement = "App", x = file)

  #Save package.json again
    writeLines(text=file, con=paste0(getwd(),"/package.json"))

  cat("\n")

}
