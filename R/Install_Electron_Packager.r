
require(rvest)

Install_Electron_Packager = function(nodejs_path="C:/Program Files/nodejs/") {


#------------------------------------------------------------#
## I. Prepare Template: [5/7] Install "electron-packager" ####
#------------------------------------------------------------#
  cat("#############", "\n")
  cat("[5/7] Installing Node.js", "\n")
  cat("#############", "\n")

  #Get path to Node.js
    answer = ""
    while(!(answer=="Y" | answer=="N")){
      answer = readline(prompt = paste0("Is Node.js installed in '", nodejs_path,"'? (Y/N)"))
    }
    if(answer=="Y") nodejs_path = nodejs_path
    if(answer=="N") {
      correct_nodejs_path=FALSE
      while(!correct_nodejs_path){
        nodejs_path = readline(prompt = paste0("In which folder is Node.js installed (->e.g. C:/Program Files/nodejs/)? [Hint: 'nodevars.bat' needs to be in this folder]: "))
        correct_nodejs_path = file.exists(paste0(nodejs_path,"/nodevars.bat"))
        if(correct_nodejs_path) cat("Node.js found in '", nodejs_path, "'. \n Continuing with the installation...", "\n", sep="")
        if(!correct_nodejs_path) cat("Node.js NOT found in '", nodejs_path, "'. Please provide the corret path to Node.js...", "\n")
      }
    }


  #run 'npm install electron-packager  -g' in 'Node.js command prompt'
      #shell("start C:/Windows/System32/cmd.exe /c 'C:/Program Files/nodejs/nodevars.bat'", translate=T)
      #shell("start 'C:/Windows/System32/cmd.exe' cd 'C:/Program Files/nodejs/'", translate=T)
      #shell("'cd C:/Program Files/nodejs/'", translate=T)
      #system2("C:/Windows/System32/cmd.exe /k 'C:/Program Files/nodejs/nodevars.bat' 'npm install electron-packager  -g'", invisible = F)

      #shell.exec("C:/Windows/System32/cmd.exe")
      #shell("cd C:/Program Files/nodejs/", translate=T)
      #shell("dir")
      #shell("start C:/Windows/System32/cmd.exe && cd C:/Program Files/nodejs/", translate=T)

      shell(paste0("cd ", nodejs_path, " && start nodevars.bat npm install electron-packager  -g"), translate=T)

    cat("\n")

}


