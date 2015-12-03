if (interactive()) {
  # Without this, you'll be prompted to save data at the end of the R session.
  q <- function (save="no", ...) {
    quit(save=save, ...)
  }

  library(BiocInstaller)
  # TODO: Consider an approach that prompts for updates (invoking `bioclite()`)
  # when opening the R REPL .  
  library(devtools)
  options(warn = 1)
}
