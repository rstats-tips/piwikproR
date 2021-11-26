#' Fetch login token
#'
#' @param credentials List with fields client_id, client_secret and url
#' @return List with login_token
#' @export
#'
get_login_token <- function(credentials) {
  url <- paste0(credentials$url, "/auth/token")

  data <- list(grant_type = "client_credentials",
               client_id = credentials$client_id,
               client_secret = credentials$client_secret)

  result <- httr::POST(url = url,
                 httr::content_type("application/json"),
                 body = rjson::toJSON(data)
                )

  if (httr::status_code(result) == 200) {
    json   <- httr::content(result, "text")
    data <- try(rjson::fromJSON(json), silent = TRUE)
    data$url <- credentials$url
    return(data)
  } else{
    return(NULL)
  }
}
