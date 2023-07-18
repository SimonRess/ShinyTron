
Install_NodeJS = function(timeout=300) {

#-------------------------------------------------------------------------------#
## I. Prepare Template: [4/7] Install Node.js incl. "Node.js command prompt" ####
#-------------------------------------------------------------------------------#
  cat("#############", "\n")
  cat("[4/7] Install Node.js", "\n")
  cat("#############", "\n")

  #File available Node.js version
    url = "https://nodejs.org/en/download"
    page = read_html(url)
    download_link_node.js = rvest::html_elements(page, css="#windows-downloadbutton") %>% rvest::html_attr("href")
    if(Sys.info()[["machine"]]=="x86-64") {
      download_link_node.js = rvest::html_elements(page, css="#main > div > article > section:nth-child(2) > table > tbody > tr:nth-child(1) > td:nth-child(3) > a") %>% rvest::html_attr("href")
    } else {
      if(Sys.info()[["machine"]]=="x86-32") download_link_node.js = rvest::html_elements(page, css="#main > div > article > section:nth-child(2) > table > tbody > tr:nth-child(1) > td:nth-child(2) > a") %>% rvest::html_attr("href")
    }

  #Download the Node.js
    cat("Downloading Node.js (Timeout:", timeout, ")...", "\n", sep = "")
    options(timeout=timeout) # timeout for download -> default 5min (for slow connections)
    file.name = tail(strsplit(download_link_node.js, "/")[[1]],1)
    download.file(download_link_node.js, file.name, mode="wb")


  # Start installation
    cat("Finish the installation by any parameters ('Tools for Native Modules' is not required).", "\n")
    shell.exec(paste0(getwd(), "/", file.name)) #install an .msi-file
    #Wait until installation is done
      readline(prompt="Has the installation of Node.js been completed? (Y)")

    cat("\n")

}
