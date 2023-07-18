# ShinyTron <a href="https://github.com/SimonRess/ShinyTron"><img src="https://github.com/SimonRess/ShinyTron/blob/main/ShinyTron_Logo.png" align="right" height="138" /></a>
(2023.07) - Automatic creation of standalone desktop applications with R-Shiny and Electron. Dead easy!

## MIT License
Copyright (c) **2023 SimonRess**

**Citation:**
```
Ress, Simon (2023). ShinyTron: Automatic creation of standalone desktop applications with R-Shiny and Electron. R package
  version 0.1.0, <https://github.com/SimonRess/ShinyTron>.
```
**BibTeX entry** for LaTeX users:
```
  @Manual{,
    title = {ShinyTron: Automatic creation of standalone desktop applications with R-Shiny and Electron},
    author = {Simon Ress},
    year = {2023},
    note = {R package version 0.1.0},
    url = {https://github.com/SimonRess/ShinyTron},
  }
```

The above **copyright notice** shall be included in all
copies, substantial portions of the Software, and other artefacts made with ShinyTron**.


## Overview
...

## Installation

``` r
# The easiest way to get shinytron will be (*not working yet since it is not released to cran now*):
install.packages("shinytron")

# Alternatively, install dplyr from github:
# install.packages("remotes")
remotes::install.github("https://github.com/SimonRess/ShinyTron")
```

### Development version

To get a bug fix or to use a feature from the development version, you
can install the development version of shinytron from GitHub.

``` r
# install.packages("remotes")
remotes::install.github("https://github.com/SimonRess/ShinyTron")
```


## Usage

``` r
library(shinytron)

# Building an standalone app from an R-Shiny app saved in ./Desktop/"App Name"
Build_App(path=file.path(Sys.getenv("USERPROFILE"),"Desktop"),
          app.name = "App Name",
          app.description="App Description",
          timeout=300,
          nodejs_path="C:/Program Files/nodejs/")
```

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on
[GitHub](https://github.com/SimonRess/ShinyTron/issues).
