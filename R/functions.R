library(tidyverse)
library(htmltools)
library(R.utils)

create_footer <- function() {

  fill <- '#000000'
  height <- '13px'

  footer <- HTML(paste0(
  "Enjoyed your visit? [Tweet at me to let me know](https://twitter.com/seabbs).", # nolint
  br(),
  "If ever in Bristol/Bath/London lets get a beer/coffee or go for a run.", # nolint
  br(),
  last_updated(),
  "\n\n",

  '<!-- Add function to open links to external links in new tab, from: -->',
  '<!-- https://yihui.name/en/2018/09/target-blank/ -->\n\n',
  '<script src="js/external-link.js"></script>'
  ))

  save_raw(footer, "_footer.html")
}

last_updated <- function() {
  return(span(
    paste0(
      'Last updated on ',
      format(Sys.Date(), format="%B %d, %Y")
    ),
    style = "font-size:0.8rem;")
  )
}

save_raw <- function(text, path) {
    fileConn <- file(path)
    writeLines(text, fileConn)
    close(fileConn)
}