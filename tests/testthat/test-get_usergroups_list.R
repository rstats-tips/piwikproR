test_that("fetching usergroups works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::fetching_usergroups_works(piwik_pro_credentials)
})

test_that("fetching members of usergroup works", {
  piwik_pro_credentials <- get_test_credentials()
  skip_if_missing_credentials(piwik_pro_credentials)
  skip_if_not_installed("piwikproRTests")
  skip_on_cran()

  piwikproRTests::fetching_members_of_usergroups_works(piwik_pro_credentials)
})
