#' Build the query
#'
#' @param date_from Start date of query
#' @param date_to End date of query
#' @param website_id website_id from piwik
#' @param columns tibble containing columns and transformations (metrics and dimensions)
#' @param filters list containing filter, best built by \code{\link{build_filter}}
#' @param metric_filters list containing filter, best built by \code{\link{build_filter}}
#' @param offset offset
#' @param max_lines limit
#' @return query as list
#' @export
#' @examples
#' columns <- tibble::tribble(
#'   ~column, ~transformation,
#'   "event_url", "to_path",
#'   "event_url", "to_domain",
#'   "website_name", "",
#'   "timestamp", "",
#'   "timestamp", "to_hour_of_day",
#'   "page_views", ""
#'   )
#'   build_query(lubridate::ymd("2021-01-01"), lubridate::ymd("2021-01-19"), "xxx",
#'               columns
#'   )
#'
build_query <- function(date_from, date_to, website_id, columns, filters = NULL,
                        metric_filters = NULL,
                        offset = 0, max_lines = 0) {

  row_to_list <- function(column, transformation = "") {
    return_list <- list("column_id" = column)
    if (transformation != "") {
      return_list[["transformation_id"]] = transformation
    }
    return(return_list)
  }

  if (max_lines == 0) {
    limit = MAX_LINES_PER_REQUEST()
  } else {
    limit = min(max_lines, MAX_LINES_PER_REQUEST())
  }
  # Build list for columns
  columns_list <- purrr::pmap(columns, row_to_list)

  query <- list(
    "date_from" = format(date_from, "%Y-%m-%d"),
    "date_to"   = format(date_to, "%Y-%m-%d"),
    "website_id" = website_id,
    "offset" = offset,
    "limit" = limit,
    "columns" = columns_list,
    "filters" = filters,
    "metric_filters" = metric_filters,
    "max_lines" = max_lines
  )
  return(query)
}
