

test_key <- function() {
  if (Sys.getenv('swiftly_api_key') == '') {
    usethis::ui_stop("No swiftly_api_key in .Renviron. Please add using `usethis::edit_r_environ()`")
  }

  if (Sys.getenv('swiftly_api_key') != '') {
    key <- Sys.getenv('swiftly_api_key')
  }

  url <- "https://api.goswift.ly/test-key"

  dat <- httr::GET(url, httr::add_headers(authorization = key))

  if (dat$status != 200) {
    usethis::ui_oops("{data$status} Error")
  }

  if (dat$status == 200) {
    usethis::ui_done("Test was successful")
  }

}

