.import.rio_sqlite <- function(file, which, ...) {
    con <- DBI::dbConnect(RSQLite::SQLite(), file)
    on.exit(DBI::dbDisconnect(con))
    tabs <- DBI::dbListTables(con)
    if (!missing(which)) {
      if (is.numeric(which)) {
          x <- DBI::dbReadTable(con, tabs[grep(which, tabs)[1]], ...)
      } else {
          x <- DBI::dbReadTable(con, which, ...)
      }
    } else {
        warning("Database contains multiple tables. Attempting first table.")
        x <- DBI::dbReadTable(con, tabs[1], ...)
    }
    return(x)
}

