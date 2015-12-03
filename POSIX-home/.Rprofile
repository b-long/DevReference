# It's best practice to put library loading code in an `if(interactive())` block in your .Rprofile, so
# that they're only loaded when you're using R interactively and not for scripting.
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
