#' Convert column-type according to column_name
#'
#' @param column_name  string
#'
#' @return string suggested type of column
get_column_type <- function(column_name) {
  if (is_column_a_metric(column_name)) {
    type_name <- "double"
  } else if(grepl("^timestamp", column_name)){
    type_name <- "date"
  } else {
    type_name <- "char"
  }
  return(type_name)
}

#' Convert column-type according to column_name
#'
#' @param data tibble
#'
#' @return tibble
apply_types <- function(data) {
  types <- colnames(data) %>% map(get_column_type)
  data %>%
    purrr::modify_at(colnames(data)[types == "double"], as.numeric) %>%
    purrr::modify_at(colnames(data)[types == "date"], as.Date)
}


