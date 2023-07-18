Packaging_App = function(path=file.path(Sys.getenv("USERPROFILE"),"Desktop"),
                         repo="shinystandalone") {


#---------------------------------------------------------#
## III. Build App [1/1]: Running 'npm run package-win' ####
#---------------------------------------------------------#
  cat("#############", "\n")
  cat("III. Build App [1/1]: Running 'npm run package-win'", "\n")
  cat("#############", "\n")

  #Change Working Directory if not already correct
    if(normalizePath(getwd()) != normalizePath(paste0(path,"/",repo))){
      #Changing Working Directory to downloaded Repo (!IMPORTANT!)
      setwd(paste0(path,"/",repo))
      cat("Working Directory changed to:", paste0(path,"/",repo), "\n")
      cat("\n")
    }

  cat("\n")
  cat("The building can take some minutes...", "\n")
  cat("\n")

  #Switch to the "shiny-electron"-folder: e.g. `cd C:\...\shiny-electron-main` AND
  #Download other necessary program libraries: `npm audit fix` (Update dependencies)
    shell(paste0("cd ",getwd(), " && npm run package-win"), translate=T)

  cat("\n")
  cat("App building finished!", "\n")
  cat("\n")

}
