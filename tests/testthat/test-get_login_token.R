test_that("get_login_token works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::get_login_token_works(piwik_pro_credentials)
})
