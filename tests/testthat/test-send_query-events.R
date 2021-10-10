test_that("/events API get's datetime", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::datetime_for_events_api(piwik_pro_credentials)
})

test_that("/sessions API get's datetime", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::datetime_for_sessions_api(piwik_pro_credentials)
})

test_that("/query API get's date", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::no_datetime_for_query_api(piwik_pro_credentials)
})


test_that("/events API can use fetch_by_day=TRUE ", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::fetch_by_day_for_events_api(piwik_pro_credentials)
})

test_that("/sessions API can use fetch_by_day=TRUE ", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::fetch_by_day_for_sessions_api(piwik_pro_credentials)
})
