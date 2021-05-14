test_that("simple request works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::simple_request_works(piwik_pro_credentials)
})

test_that("metric filter works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::metric_filter_works(piwik_pro_credentials)
})

test_that("dimension filter works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::metric_filter_works(piwik_pro_credentials)
})


test_that("csv data retrieval works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::csv_data_retrieval_works(piwik_pro_credentials)
})


test_that("NULL values at level 3 works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::NULL_values_at_level_3_works(piwik_pro_credentials)
})


test_that("NULL values at level 2 works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::NULL_values_at_level_2_works(piwik_pro_credentials)
})

test_that("umlauts works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::umlauts_works(piwik_pro_credentials)
})

test_that("list values as return value works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::list_values_as_return_value_works(piwik_pro_credentials)
})

test_that("filter with transformation works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::filter_with_transformation_works(piwik_pro_credentials)
})

test_that("filter with and without transformation works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::filter_with_and_without_transformation_works(piwik_pro_credentials)
})

test_that("filter with different type for value using lists works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::filter_with_different_type_for_value_using_lists_works(piwik_pro_credentials)
})

test_that("daily splitting with empty results works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::daily_splitting_with_empty_results_works(piwik_pro_credentials)
})

test_that("paging works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::paging_works(piwik_pro_credentials)
})

test_that("types are set for empty results", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()
  
  piwikproRTests::types_are_set_for_empty_results(piwik_pro_credentials)
})
