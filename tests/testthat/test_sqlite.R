context("Export to SQLite")
test_that("Export", {
    expect_true(export(mtcars, "example.sqlite", which = "mtcars") %in% dir())
})

context("Import from SQLite")
test_that("Import", {
    expect_true(is.data.frame(import("example.sqlite", which = "mtcars")))
})

unlink("example.sqlite")
