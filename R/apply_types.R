#' Convert column-type according to column_name
#'
#' @param column_name  string
#' @param timestamp_to_date boolean convert timestamp to date
#'
#' @return string suggested type of column
get_column_type <- function(column_name, timestamp_to_date = TRUE) {
  if (is_column_a_metric(column_name)) {
    type_name <- "double"
  } else if (grepl("^timestamp", column_name) & column_name != "timestamp__to_hour_of_day") {
    if (timestamp_to_date) {
      type_name <- "date"
    } else {
      type_name <- "datetime"
    }
  } else if (column_name == "timestamp__to_hour_of_day") { # Hours to numeric
    type_name <- "double"
  } else {
    type_name <- "char"
  }
  return(type_name)
}

#' Convert column-type according to column_name
#'
#' @param data tibble
#' @param timestamp_to_date boolean convert timestamp to date
#'
#' @return tibble
apply_types <- function(data, timestamp_to_date = TRUE) {
  types <- colnames(data) %>% map(get_column_type, timestamp_to_date)
  data %>%
    purrr::modify_at(colnames(data)[types == "double"], as.numeric) %>%
    purrr::modify_at(colnames(data)[types == "date"], as.Date) %>%
    purrr::modify_at(colnames(data)[types == "datetime"],
                     lubridate::as_datetime)
}
