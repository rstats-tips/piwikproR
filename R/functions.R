#' Maximum number of lines requested in Analytics-API
#'
#' @return int
MAX_LINES_PER_REQUEST_ANALYTICS_API <- function() {
  100000
}

#' Maximum number of lines requested in Users-API
#'
#' @return int
MAX_LINES_PER_REQUEST_USERS_API <- function() {
  1000
}

#' get_test_credentials
#' getting credentials for testing
#'
#' Fills credentials out of ENV into a list
#'
#' @return list
get_test_credentials <- function() {
  tryCatch(
    {
      piwik_pro_credentials <- list(
        client_id = Sys.getenv("R_PIWIK_client_id"),
        client_secret = Sys.getenv("R_PIWIK_client_secret"),
        url = Sys.getenv("R_PIWIK_url"),
        default_site = Sys.getenv("R_PIWIK_default_site"),
        alternative_site = Sys.getenv("R_PIWIK_alternative_site"),
        client_id_users = Sys.getenv("R_PIWIK_client_id_users"),
        client_secret_users = Sys.getenv("R_PIWIK_client_secret_users")
      )
      return(piwik_pro_credentials)
    },
    error = function(cond) {
      return(list())
    },
    warning = function(w) {
      return(list())
    }
  )
}

skip_if_missing_credentials <- function(credentials) {
  if (!exists("client_id", credentials)) {
    testthat::skip("No credentials for testing - please read the documentation... ")
  }
}
