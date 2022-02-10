test_that("fetching usergroups works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::fetching_usergroups_works(piwik_pro_credentials)
})
