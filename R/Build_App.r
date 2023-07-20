#---------------------------------------#
# 1. Creating Electron-App by Script ####
#---------------------------------------#

#rm(list=ls())

#Install/Load packages
#if(!require("rvest")) install.packages("rvest")
require(rvest)

Build_App = function(path=file.path(Sys.getenv("USERPROFILE"),"Desktop"),
                     app.name = "App Name",
                     app.description="App Description",
                     timeout=300,
                     nodejs_path="C:/Program Files/nodejs/") {

#------------------------#
# I. Prepare Template ####
#------------------------#

#---------------------------------------------------------------------------------------------------#
## I. Prepare Template [1/7] Download the "shiny-electron"-template for building standalone apps ####
#---------------------------------------------------------------------------------------------------#

  repo = Load_shiny_electron_tamplate(path=path)

#--------------------------------------------------------------------------------#
## I. Prepare Template: [2/7] Download and insert required 'R-Portable'-files ####
#--------------------------------------------------------------------------------#

  Load_Install_RPortable(path=path, repo=repo, timeout=timeout)

#--------------------------------------------------------------------------------#
## I. Prepare Template: [3/7] Download and insert required 'R-Portable'-files ####
#--------------------------------------------------------------------------------#

  Insert_RPortable(path=path, repo=repo)

#-------------------------------------------------------------------------------#
## I. Prepare Template: [4/7] Install Node.js incl. "Node.js command prompt" ####
#-------------------------------------------------------------------------------#

  Install_NodeJS(timeout=timeout)

#------------------------------------------------------------#
## I. Prepare Template: [5/7] Install "electron-packager" ####
#------------------------------------------------------------#

  Install_Electron_Packager(nodejs_path=nodejs_path)

#-------------------------------------------------------------------------------------------------------#
## I. Prepare Template: [6/7] INSTALL npm-libraries dependencies for electron into standalone-folder ####
#-------------------------------------------------------------------------------------------------------#

  Install_npm_libraries(path=path, repo=repo)

#----------------------------------------------------------------------------------------------------#
## I. Prepare Template: [7/7] UPDATE npm-libraries dependencies for electron in standalone-folder ####
#----------------------------------------------------------------------------------------------------#

  Update_npm_libraries(path=path, repo=repo)

#----------------------#
# II. Customize App ####
#----------------------#

#----------------------------------------------------------------------------------------#
## II. Customize App [1/3]: Include your App & required files (e.g. data or pictures) ####
#----------------------------------------------------------------------------------------#
  cat("#############", "\n")
  cat("II. Customize App [2/3]: Install all required R-packages", "\n")
  cat("#############", "\n")

  cat("\n")

  cat("Now copy your R-Shiny App and all required files into the downloaded repo:", "\n")
  cat("- The 'app.r'-file have to be in the '", paste0(path,"/",repo), "'-folder.", "\n", sep="")
  cat("- Required data & other required files should be included in the '", paste0(path,"/",repo,"data"), "'-folder (if nec. adjust app.r).", "\n", sep="")

  #Wait until user included all required files into the repo
    answer = "N"
    while(answer!="Y"){
      answer = readline(prompt = "Do you included your app.R and all required files into the repo? (Y/N)")
    }

  cat("\n")


#--------------------------------------------------------------------------------------------#
## II. Customize App [2/3]: Install all required packages of your app into library-folder ####
#--------------------------------------------------------------------------------------------#

  Install_required_RPackages(path=path, repo=repo)

#---------------------------------------------------------------------#
## II. Customize App [3/3]: Adjusting the configuration of the app ####
#---------------------------------------------------------------------#

  Adjust_config(app.name=app.name, app.description=app.description)

#-------------------#
# III. Build App ####
#-------------------#

#---------------------------------------------------------#
## III. Build App [1/1]: Running 'npm run package-win' ####
#---------------------------------------------------------#

  Packaging_App(path=path, repo=repo)


#-------------------------------#
# IV. Extracting and testing ####
#-------------------------------#

#--------------------------------------#
## IV. Extracting and testing [1/2] ####
#--------------------------------------#

  cat("Now we are testing whether your Shiny-Standalone App is working or not...", "\n")
  cat("\n")
  cat("[1/2] Copy or cut the folder '",paste0(getwd(),"/App/",app.name, "-win32-x64" ), "' into another location.", "\n", sep="")
  readline(prompt = "Press 'Enter' to continue...")
  cat("\n")

  cat("[2/2] Now start the '", paste0("./",app.name, ".exe"), "' from within the folder you copied/cutted.", "\n", sep="")
  cat("\n")
  cat("[Hint] If a window opens, but you can't see your app, click on 'View' and then 'Force Reload'. This works most of the time :)", "\n", sep="")
  cat("\n")

   answer = ""
   while(!(answer=="Y" | answer=="N")){
     answer = readline(prompt = "Is your standalone app worked well? (Y/N)")
   }

   if(answer=="Y"){
     cat("Please support the project and give the repos a 'star'!  \n Also follow me to get more exciting projects :) \n")
     cat("In 5...", "\n")
     Sys.sleep(1)
     cat("4...", "\n")
     Sys.sleep(1)
     cat("3...", "\n")
     Sys.sleep(1)
     cat("2...", "\n")
     Sys.sleep(1)
     cat("1...", "\n")
     Sys.sleep(1)
     browseURL("https://github.com/SimonRess/ShinyTron")
     Sys.sleep(5)
     browseURL("https://github.com/SimonRess/")
   }
   if(answer=="N"){
     cat("Please tell me your problem! I will try to fix it :) \n")
     cat("In 5...", "\n")
     Sys.sleep(1)
     cat("4...", "\n")
     Sys.sleep(1)
     cat("3...", "\n")
     Sys.sleep(1)
     cat("2...", "\n")
     Sys.sleep(1)
     cat("1...", "\n")
     Sys.sleep(1)
     browseURL("https://github.com/SimonRess/ShinyTron/issues")
   }



}
