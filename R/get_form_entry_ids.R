#' Get Google Form Entry Ids From Scrape
#'
#' Get Google Form Entry Ids From Scrape
#'
#' @param scrape HTML Output from Scraping Google Form
#' @export
#' @importFrom magrittr %>%
#' @examples \dontrun{
#' url %>% get_form() %>% get_form_entry_ids() -> entries
#' }
get_form_entry_ids <- function (scrape) {
    . <- NULL
    field_names <- rvest::html_form(scrape)[[1]] %>%
      .[["fields"]] %>%
      names()
    unique(field_names[grepl("entry.", field_names)])
}

