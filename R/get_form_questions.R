#' Extracts Google Form Question Text
#'
#' Extracts Google Form Question Text From Scrape
#'
#' @param scrape HTML Output from Scraping Google Form
#' @export
#' @importFrom magrittr %>%
#' @examples \dontrun{
#' url %>% get_form() %>% get_form_questions() -> questions
#' }
get_form_questions <- function (scrape) {
    . <- NULL
    qt <- rvest::html_nodes(scrape, ".ss-q-title") %>% rvest::html_text() %>%
        gsub("\n", "", .)
    if (length(qt) != 0) {
        qt
    }
    else {
        rvest::html_nodes(scrape, ".freebirdFormviewerViewItemsItemItemTitle") %>%
            rvest::html_text()
    }
}

