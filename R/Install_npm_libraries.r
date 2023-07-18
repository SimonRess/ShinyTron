Install_npm_libraries = function(path=file.path(Sys.getenv("USERPROFILE"),"Desktop"),
                                 repo="shinystandalone") {

#-------------------------------------------------------------------------------------------------------#
## I. Prepare Template: [6/7] INSTALL npm-libraries dependencies for electron into standalone-folder ####
#-------------------------------------------------------------------------------------------------------#
  cat("#############", "\n")
  cat("[6/7] Installing necessary npm-libraries", "\n")
  cat("#############", "\n")


  #Change Working Directory if not already correct
    if(normalizePath(getwd()) != normalizePath(paste0(path,"/",repo))){
      #Changing Working Directory to downloaded Repo (!IMPORTANT!)
      setwd(paste0(path,"/",repo))
      cat("Working Directory changed to:", paste0(path,"/",repo), "\n")
      cat("\n")
    }

  cat("\n")
  cat("The installation can take some minutes...", "\n")


  #Switch to the "shiny-electron"-folder: e.g. `cd C:\...\shiny-electron-main` AND
  #Download other necessary program libraries: `npm install` (Install dependencies for electron)
    shell(paste0("cd ",getwd(), " && npm install"), translate=T)

  cat("\n")

}
