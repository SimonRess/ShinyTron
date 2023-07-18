
Insert_RPortable = function(path=file.path(Sys.getenv("USERPROFILE"),"Desktop"),
                            repo="shinystandalone") {



#--------------------------------------------------------------------------------#
## I. Prepare Template: [3/7] Download and insert required 'R-Portable'-files ####
#--------------------------------------------------------------------------------#
  cat("#############", "\n")
  cat("[3/7] Insert required 'R-Portable'-files into Repo", "\n")
  cat("#############", "\n")

  #Change Working Directory if not already correct
    if(normalizePath(getwd()) != normalizePath(paste0(path,"/",repo))){
      #Changing Working Directory to downloaded Repo (!IMPORTANT!)
      setwd(paste0(path,"/",repo))
      cat("Working Directory changed to:", paste0(path,"/",repo), "\n")
      cat("\n")
    }


  #Copy required r-portable files into shiny-electron repo
    cat("Copying required r-portable files into the shiny-electron repo...", "\n", sep = "")
    source_dir = paste0(getwd(),"/R-Portable/App/R-Portable/")
    files_to_copy <- list.files(source_dir)
    destination_dir <- paste0(getwd(),"/R-Portable-Win/")
    N = length(files_to_copy)
    i = 0

    cat("[Copying some files may take same time]", "\n")
    for (file in files_to_copy) {
      i = i +1
      cat("[",i,"/",N,"] Copy folder/file: ", file, " ...", "\n", sep="")
      file.copy(from = paste0(getwd(),"/R-Portable/App/R-Portable/",file), to = destination_dir,overwrite = T, recursive = TRUE)
    }
    rm(N,i)

    cat("Deleting the R-Portable-EXE and folder...", "\n")
    unlink(dirname(dirname(source_dir)), recursive = TRUE) # delete "R-Portable"-folder
    unlink(file.name, recursive = TRUE) # delete "R-Portable"-Installation Routine (.exe)
    cat("\n")

}
