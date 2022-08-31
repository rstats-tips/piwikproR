# piwikproR
R package for accessing data from Piwik PRO via API.

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/piwikproR)](https://CRAN.R-project.org/package=piwikproR)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/last-month/piwikproR?color=blue)](https://r-pkg.org/pkg/piwikproR)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/grand-total/piwikproR?color=blue)](https://r-pkg.org/pkg/piwikproR)
[![R-CMD-check](https://github.com/dfv-ms/piwikproR/workflows/R-CMD-check/badge.svg)](https://github.com/dfv-ms/piwikproR/actions)
<!-- badges: end -->

[PIWIK PRO](https://piwik.pro/) is a tool to measure traffic of a website. 
They offer an [API](https://developers.piwik.pro/en/latest/custom_reports/http_api/http_api.html) 
for fetching all metrics and dimensions so you can use them in your own program.

This R-Package uses the API to fetch the data from PIWIK PRO using R-code. 
You get the data as tibble (or as a data.frame). So it's easy to analyze the data 
with the whole power of R.

# Installation

## CRAN Version

The package is now [available on CRAN](https://CRAN.R-project.org/package=piwikproR). 
So you can install it by running

```
install.packages("piwikproR")
```

## Development Version

Using `devtools` it's easy to install piwikproR:
```
devtools::install_github("dfv-ms/piwikproR")
```

# Usage

## Load the library
```
library(piwikproR)
```

## Credentials for API, token
First you need to setup an access to the API. See here: 
[https://developers.piwik.pro/en/latest/platform/getting_started.html#create-api-credentials-and-an-access-token]

Let's say you put them into a list:

```
piwik_pro_credentials <- list(
  client_id = "my_client_id",
  client_secret = "my_client_secret",
  url = "https://my_site.piwik.pro"
 )
 ```
 
 Using these credential you can fetch a token
 ```
 token <- get_login_token(piwik_pro_credentials)
 ```
 
 ## Website id
 Set the website_id and the date range.
 
 ```
website_id <- 'my_website_id'
start.date <- "2021-04-01"
end.date <- "2021-04-30"
```

## Defining the columns to be fetched
Now we define the columns we want to fetch. Here's an example:

We want to fetch the date, the url (only the path without the hostname) and the 
page_views:
```
columns <- tibble::tribble(
  ~column, ~transformation,
  "timestamp", "",
  "event_url", "to_path",
  "page_views", "",
)
```

 ## Filters
 We're only interested in -- let's say -- Desktop requests. So let's set a filter:
 
 ```
 filters <- tibble::tribble(
  ~column, ~operator, ~value,
  "device_type", "eq", 0
)
filters <- build_filter(filters, "and")
 ```
 
 ## Fetching the data
 
 ```
 query <- build_query(lubridate::ymd(start.date), lubridate::ymd(end.date), website_id,
                     filters = filters,
                     columns, max_lines = 0
)
data <- send_query(query, token, caching = TRUE, fetch_by_day = FALSE)
```

# Metrics and Dimensions Documentation
PIWIK PRO offers a great documentation of all metrics and dimensions starting 
here [https://developers.piwik.pro/en/latest/custom_reports/index.html]

# Developing

I'm using unit tests to test my code. But these tests run against
a special website_id whose data is not publicly available. So I put all those sensitive
data into a private package `piwikproRTests`. If this package is not available
all tests are skipped.

# Issues
If you find a bug or if you have a feature request feel free and open an 
[issue](https://github.com/dfv-ms/piwikproR/issues)

# Documentation
Further documentation can be found here: https://PiwikProR.rstats-tips.net/index.html

# Thanks
![dfv media group](vignettes/figures/dfv_logo_en.png)

Thanks to my employer [dfv media group](https://english.dfv.de/) for the 
permission to publish this package as open source.
