#' is_column_a_metric
#' Checks if column_name indicates numeric values
#' Uses https://developers.piwik.pro/en/latest/custom_reports/columns.html
#'
#' @param column_name string
#'
#' @return boolean
is_column_a_metric <- function(column_name) {

  # remove trailing _number
  column_name <- stringr::str_remove(column_name, "_[0-9]")

  # remove traing __.* for appending transformations
  column_name <- stringr::str_remove(column_name, "__.*")

  # Metrics as of https://developers.piwik.pro/en/latest/custom_reports/columns.html
  metrics <- tibble::tribble(
                                  ~Metric.Name,                    ~Column.ID,    ~Scope,   ~Type,
                                      "Events",                      "events", "session",   "int",
                                  "Page views",                  "page_views", "session",   "int",
                           "Unique page views",           "unique_page_views", "session",   "int",
                                     "Entries",                     "entries", "session",   "int",
                                       "Exits",                       "exits", "session",   "int",
                                     "Bounces",                     "bounces", "session",   "int",
                                    "Sessions",                    "sessions", "session",   "int",
                                    "Visitors",                    "visitors", "session",   "int",
                     "% of returning visitors",     "returning_visitors_rate", "session", "float",
                                       "Users",                       "users", "session",   "int",
                                 "Visitor IPs",                 "visitor_ips", "session",   "int",
                                    "Outlinks",                    "outlinks", "session",   "int",
                             "Unique outlinks",             "unique_outlinks", "session",   "int",
                                   "Downloads",                   "downloads", "session",   "int",
                            "Unique downloads",            "unique_downloads", "session",   "int",
                                    "Searches",                    "searches", "session",   "int",
                             "Unique searches",             "unique_searches", "session",   "int",
                               "Custom events",               "custom_events", "session",   "int",
                        "Unique custom events",        "unique_custom_events", "session",   "int",
                         "Content impressions",         "content_impressions", "session",   "int",
                  "Unique content impressions",  "unique_content_impressions", "session",   "int",
                        "Content interactions",        "content_interactions", "session",   "int",
                 "Unique content interactions", "unique_content_interactions", "session",   "int",
                            "Goal conversions",            "goal_conversions", "session",   "int",
                     "Unique goal conversions",     "unique_goal_conversions", "session",   "int",
                       "Ecommerce conversions",       "ecommerce_conversions", "session",   "int",
                   "Ecommerce abandoned carts",   "ecommerce_abandoned_carts", "session",   "int",
                            "Unique purchases",            "unique_purchases",   "event",   "int",
                                  "Entry rate",                  "entry_rate", "session", "float",
                                   "Exit rate",                   "exit_rate", "session", "float",
                            "Exit rate events",            "exit_rate_events", "session", "float",
                                 "Bounce rate",                 "bounce_rate", "session", "float",
                                 "Bounce rate",          "bounce_rate_events", "session", "float",
                    "Content interaction rate",    "content_interaction_rate", "session", "float",
                        "Goal conversion rate",        "goal_conversion_rate", "session", "float",
                   "Ecommerce conversion rate",   "ecommerce_conversion_rate", "session", "float",
                          "Events per session",          "events_per_session", "session", "float"
                 )
  (column_name %in% metrics$Column.ID) | (is_dimension_numeric(column_name))
}
