#context("Run slr with packaged dataset stroke")

data(stroke)

fit <- try(BIOS625HW3::slr("Depression",'Age',stroke),
           silent = TRUE)

test_that("No error in fitting slr model for the stroke data", {
  
  expect_false(inherits(fit, "try-error"))
  
})