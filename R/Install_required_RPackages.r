

Install_required_RPackages = function(path=file.path(Sys.getenv("USERPROFILE"),"Desktop"),
                                      repo="shinystandalone") {

#--------------------------------------------------------------------------------------------#
## II. Customize App [2/3]: Install all required packages of your app into library-folder ####
#--------------------------------------------------------------------------------------------#
  cat("#############", "\n")
  cat("II. Customize App [2/3]: Install all required R-packages", "\n")
  cat("#############", "\n")

  cat("\n")


  #Change Working Directory if not already correct
    if(normalizePath(getwd()) != normalizePath(paste0(path,"/",repo))){
      #Changing Working Directory to downloaded Repo (!IMPORTANT!)
      setwd(paste0(path,"/",repo))
      cat("Working Directory changed to:", paste0(path,"/",repo), "\n")
      cat("\n")
    }


  #Find all required packages (-> packages loaded by library(...) or require(...)) of your app.R
    file = readLines(paste0(getwd(),"/app.r"))
    pattern = ".*library\\(\\s*(.*?)\\s*\\).*"
    req.packages = as.vector(na.omit(unlist(lapply(file, \(x) regmatches(x, regexec(pattern, x))[[1]][2]))))
    cat("Install packages into folder: ", paste0(getwd(),"/R-Portable-Win/library"), "\n")
    cat("Installing packages:", req.packages, "\n")

    cat("\n")
    cat("The installation can take some minutes and will start soon...", "\n")
    Sys.sleep(1)
    cat("5...","\n")
    Sys.sleep(1)
    cat("4...","\n")
    Sys.sleep(1)
    cat("3...","\n")
    Sys.sleep(1)
    cat("2...","\n")
    Sys.sleep(1)
    cat("1...","\n")
    Sys.sleep(1)

  #Install all required packages of your app into the "shiny-electron-main\R-Portable-Win\library"-folder
    #Checking functionallity
    #shell(paste0('cd "',getwd(), '/R-Portable-Win/bin/" && start R.exe', ' -e setwd(dirname(dirname(getwd()))) -e getwd() -e 1+1 -e Sys.sleep(5)')) #working

    #Not working, breaks directly after calling, probably is the called R-instance partially blocked by the calling R-instance
    #shell(paste0('cd "',getwd(), '/R-Portable-Win/bin/" && start R.exe',' --vanilla -e install.packages("shiny",repos="https://cran.rstudio.com/")')) #Not working
    #shell(paste0('cd "',getwd(), '/R-Portable-Win/bin/" && start Rscript.exe',' -e install.packages("shiny",repos="https://cran.rstudio.com/")')) #Not working

    for(p in req.packages){
      system2(command = paste0(getwd(),"/R-Portable-Win/bin/R.exe"),
      args = c("--vanilla","-e", paste0("install.packages('",p,"',repos='https://cran.rstudio.com/')"))) #NO SPACES in COMMANDS ALLOWED! // Option --vanilla:  don't use user defined R-Settings
    }

  cat("\n")


}
