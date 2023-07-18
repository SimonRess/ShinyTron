
require(rvest) # html_elements()

require(magrittr) # Pipe: %>%

Load_Install_RPortable = function(path=file.path(Sys.getenv("USERPROFILE"),"Desktop"),
                                  repo="shinystandalone",
                                  timeout=300) {

#--------------------------------------------------------------------------------#
## I. Prepare Template: [2/7] Download and insert required 'R-Portable'-files ####
#--------------------------------------------------------------------------------#
  cat("#############", "\n")
  cat("[2/7] Download/Install 'R-Portable'-files", "\n")
  cat("#############", "\n")

  #Change Working Directory if not already correct
    if(normalizePath(getwd()) != normalizePath(paste0(path,"/",repo))){
      #Changing Working Directory to downloaded Repo (!IMPORTANT!)
      setwd(paste0(path,"/",repo))
      cat("Working Directory changed to:", paste0(path,"/",repo), "\n")
      cat("\n")
    }


  #Choose an R-Portable Version from the available once
    cat("Checking available r-portable versions...", "\n")
    url = "https://sourceforge.net/projects/rportable/files/R-Portable/"
    page = rvest::read_html(url)
    available.r.versions = rvest::html_elements(page, css="#files_list > tbody > tr > th > a > span") %>% rvest::html_text()
    cat("------",  "\n")
    cat("Available R-Versions:\n", paste0(available.r.versions, ", "), "\n", sep = "")
    r.version.to.install = readline(prompt="Which R-Version should be installed (type in version number): ")
    while(!(r.version.to.install %in% available.r.versions)) {
      cat("The selected r-version'", r.version.to.install, "'is not available! \n Choose one of the following:", "\n")
      cat(available.r.versions, "\n")
      r.version.to.install = readline(prompt="Which R-Version should be installed (type in version number): ")
    }
    cat("------", "\n")

  #Download the choosen R-Portable version
    cat("Downloading R-Portable version:", r.version.to.install, " (Timeout:", timeout, "s)...", "\n", sep = "")
    download_link = paste0(url, r.version.to.install, "/", "R-Portable_", r.version.to.install ,".paf.exe/download")
    options(timeout=timeout) # timeout for download -> default 5min (for slow connections)
    file.name = paste0("R-Portable_", r.version.to.install ,".paf.exe")
    utils::download.file(download_link, file.name, mode="wb") #R-Portable/


  # Start installation
    cat("Keep the defaults of the installation (directory: '",paste0(path,"/",repo, "R-Portable"),"').", "\n", sep="")
    system2(paste0(getwd(),"/R-Portable_", r.version.to.install ,".paf.exe"))
    # hand over parameters to installation routine
    #system2(paste0(getwd(),"/R-Portable_", r.version.to.install ,".paf.exe /D='C:/Users/sress/Desktop/shiny-electron(Repo) - Kopie/R-Portable_4.1.1'")) # R-Portable/
    #r.version.to.install = "4.1.1"

  #Wait until installation is done
    #path = readline(prompt="In which folder did you installed R-Portable: ")
    readline(prompt="Has the installation of R-Portable been completed? (Y)")
}
