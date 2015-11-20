#' Creates Function Linking Form Entries To Post Content
#'
#' Creates Function Linking Form Entries To Post Content. This function allows you to embed
#'
#' @param form Can be either the form_url or form_id
#' @export
#' @importFrom magrittr %>%
#' @examples \dontrun{
#' url %>% gformr() -> new_post_to_form
#' new_post_to_form(content_to_post_to_url)
#' }
gformr <- function (form) {
    . <- NULL
    entry.ids <- get_form(form) %>% get_form_entry_ids()
    form_url <- make_url(form, "post")

    function(post_content) {
        r <- httr::POST(form_url, query = stats::setNames(as.list(as.character(post_content)),
            as.character(entry.ids)))
    }
}

