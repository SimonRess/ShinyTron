#-------------------------------------#
# 1. Creating Electron-App by Hand ####
#-------------------------------------#

# I. General steps to prepare the template:
  # 1. Install [Node.js](https://sourceforge.net/projects/rportable/) -> JavaScript Runtime, used for installation and running of the scripts
  # 2. Download repo: https://git.noc.ruhr-uni-bochum.de/jeworsbv/shiny-electron
  # 3. Download & Install [R-Portable](https://sourceforge.net/projects/rportable/files/R-Portable/)
  # 4. Then copy the contents of the "App\R-Portable" subdirectory to the "R-Portable-Win" subfolder of the "shiny-electron"-folder.
  #    The folders "test", "docs" (and possibly also "TCL") can be deleted to save storage space in the app.
  # 5. Create helper-scripts for the create of the app: type `npm install electron-packager -g` in the "Node.js command prompt"
  #    The "-g" parameter ensures that the script is available globally and not just for a single project.
  #    This means that it will also be available for other shiny apps in the future.
  # 6. Switch to the "shiny-electron"-folder: e.g. `cd C:\...\shiny-electron-main`
  # 7. Download other necessary program libraries: `npm install` (Install dependencies for electron) & `npm audit fix` (Update dependencies)
#
# II. Customize individual app
  # 1. (A) Open R-Studio and (B) Install all required packages of your app into the "shiny-electron-main\R-Portable-Win\library"-folder:
  #    e.g. `install.packages("shiny", lib = "C:/Users/simon/Desktop/StandaloneApp/shiny-electron-main/R-Portable-Win/library")`
  # 2. Adjusting the configuration of the app within the "package.json"-file:
  #    - name: The name of the app (shown in the title bar). This entry must be repeated in the script.
  #    - description: Description of the app
  #    - scripts: The instructions for building the program. Further options can be adjusted here
  #      -out=Path: The target path where the program will be placed
  #      -version-string.CompanyName=MyCompany: The publisher
  #      -version-string.ProductName=\"Shiny Electron App\": The name of the app. Here, quotation marks must be escaped with \
  #      -repository: The information is only relevant if the program is published in a repository
  # 3. Create the program by typing `npm run package-win` in the "Node.js command prompt".
  #    (We need to be in the folder that contains the "package.json" file)
#
# III. Run the app
  # 1. After the script has run through, a subfolder with the finished program appears in the folder configured under "--out".
  # 2. The app can be started by double-clicking on "Appname.exe" (in the template "Shiny Electron App.exe").



#---------------------------------------#
# 2. Creating Electron-App by Script ####
#---------------------------------------#

#rm(list=ls())

#Install/Load packages
#if(!require("rvest")) install.packages("rvest") #
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
     browseURL("https://github.com/SimonRess/Shiny-Electron")
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
     browseURL("https://github.com/SimonRess/Shiny-Electron/issues")
   }



}
