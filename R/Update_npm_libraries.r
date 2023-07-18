Update_npm_libraries = function(path=file.path(Sys.getenv("USERPROFILE"),"Desktop"),
                                repo="shinystandalone") {

#----------------------------------------------------------------------------------------------------#
## I. Prepare Template: [7/7] UPDATE npm-libraries dependencies for electron in standalone-folder ####
#----------------------------------------------------------------------------------------------------#
  cat("#############", "\n")
  cat("[7/7] UPDATE necessary npm-libraries", "\n")
  cat("#############", "\n")

  #Change Working Directory if not already correct
    if(normalizePath(getwd()) != normalizePath(paste0(path,"/",repo))){
      #Changing Working Directory to downloaded Repo (!IMPORTANT!)
      setwd(paste0(path,"/",repo))
      cat("Working Directory changed to:", paste0(path,"/",repo), "\n")
      cat("\n")
    }

  cat("\n")
  cat("The updating can take some minutes...", "\n")

  #Switch to the "shiny-electron"-folder: e.g. `cd C:\...\shiny-electron-main` AND
  #Download other necessary program libraries: `npm audit fix` (Update dependencies)
    shell(paste0("cd ",getwd(), " && npm audit fix"), translate=T)

  cat("\n")

}
