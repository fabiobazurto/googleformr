#' Scrape Google Form Content
#'
#' Get Google Form content by scraping page
#'
#' @param form Can be either the form_url or form_id
#' @export
#' @importFrom magrittr %>%
#' @examples \dontrun{
#' url %>% get_form() -> scrape
#' }
get_form <- function (form) {
    . <- NULL
    make_url(form, "get") %>% rvest::html()
}

