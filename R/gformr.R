#' Creates Function Linking Form Entries To Post Content
#'
#' Creates Function Linking Form Entries To Post Content. This function allows you to embed
#'
#' @param form Can be either the form_url or form_id
#' @param custom_reply is null, unless you want to say something
#' @param active allows programmatic silencing gformr functionality if embedded elsewhere
#' @export
#' @importFrom magrittr %>%
#' @examples \dontrun{
#' new_post_to_form <- gformr(url)
#' new_post_to_form(content_to_post_to_url)
#' }
gformr <- function (form, custom_reply = NULL, active=TRUE) {
    . <- NULL
    entry.ids <- get_form_entry_ids(get_form(form))
    form_url <- make_url(form, "post")

    function(post_content) {
      if (active){
        r <- httr::POST(form_url, query = stats::setNames(as.list(as.character(post_content)),
            as.character(entry.ids)))

        if (!is.null(custom_reply)){
           r %>% httr::status_code() -> status
          if (floor(status/100)==2){
            cat(custom_reply)
          } else {
            cat("Error")
          }
        }
      }
    }
}

