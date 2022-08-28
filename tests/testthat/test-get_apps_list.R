test_that("fetching apps works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::fetching_apps_works(piwik_pro_credentials)
})

test_that("fetching metasites works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::fetching_metasites_works(piwik_pro_credentials)
})

test_that("fetching permissions for apps works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::fetching_permissions_for_apps_works(piwik_pro_credentials)
})

test_that("fetching permissions for metasites works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::fetching_permissions_for_metasites_works(piwik_pro_credentials)
})
