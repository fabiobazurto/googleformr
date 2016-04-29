#' Creates Function Linking Form Entries To Post Content
#'
#' Creates Function Linking Form Entries To Post Content. This function allows you to embed
#'
#' @param form Can be either the form_url or form_id
#' @param custom_reply is null, unless you want to say something
#' @export
#' @return a function(post_content) to post content to the google form
#' @examples
#' \dontrun{
#' new_post_to_form <- gformr(url)   # this returns a function with post_content as param
#' new_post_to_form(content_to_post_to_url)
#' }
gformr <- function (form, custom_reply = NULL, active=TRUE) {
  entry.ids <- get_form_entry_ids(get_form(form))
  form_url <- make_url(form, "post")

  function(post_content) {
    if (active){
      if (!is.null(custom_reply)){
        message(custom_reply)
      }
      invisible(httr::POST(form_url, query = stats::setNames(as.list(as.character(post_content)),
                                                             as.character(entry.ids))))
    }
  }
}

