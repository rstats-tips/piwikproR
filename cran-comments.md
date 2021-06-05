## Test environments
* local OS X install, R 4.1.0 and 4.0.5
* ubuntu 20.04 LTS, R 4.0.5
* win-builder (devel and release)
* Checks with r-hub

### Local tests
Functional tests require an account at Piwik Pro and are specific to this
account. I run these tests locally but can't publish them because of their
sensitive content. I encapsulate these tests in a private package called
`piwikproRTests`.


## R CMD check results
There were no ERRORs or WARNINGs. 

There were 2 NOTES:

* checking CRAN incoming feasibility ... NOTE
* package dependancy for tests (`piwikproRTests` see above)
Setting _R_CHECK_FORCE_SUGGESTS_ to false solves the note.

## Downstream dependencies
