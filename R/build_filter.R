#' Build filter from tribble
#'
#' @param filters tribble with columns
#'
#' \itemize{
#'   \item column
#'   \item operator
#'   \item value
#' }
#'
#' Possible values for operator:
#' \itemize{
#'   \item (not_)contains
#'   \item (not_)icontains
#'   \item start_with
#'   \item ends_with
#'   \item (not_)matches
#'   \item eq
#'   \item neq
#'   \item (not_)empty
#' }
#' @param global_operator "and" or "or"
#' @return filter json encoded to feed to \code{\link{build_query}}
#' @importFrom magrittr %>%
#' @export
#' @examples
#' filters <- tibble::tribble(
#'  ~column, ~operator, ~value,
#'  "event_url", "matches", "Zamperoni",
#'  "event_url", "matches", "-1[34]"
#' )
#' # With optional transformation
#' filters <- tibble::tribble(
#'  ~column, ~operator, ~value, ~transformation,
#'  "event_url", "starts_with", "/medien", "to_path",
#'  "event_url", "matches", "-1[34]", NULL
#' )
#'  filters <- build_filter(filters, "and")
#'
#' # If values of two or more different types are used use lists
#'
#' filters <- tibble::tribble(
#'   ~column, ~operator, ~value,
#'   "device_type", "eq", list(0),
#'   "location_country_name", "eq", list("DE")
#' )
#'
build_filter <- function(filters, global_operator = "and") {
  list(
    "operator" = global_operator,
    "conditions" = pmap(filters, build_filter_single)
  )
}

build_filter_single <- function(column, operator, value, transformation = NULL){
  list(
    "operator" = "or",
    "conditions" = list(
      list(
        "transformation_id" = transformation,
        "column_id" = column,
        "condition" = list(
          "operator" = operator,
          "value" = unlist(value)
        ))
    )
  )
}


