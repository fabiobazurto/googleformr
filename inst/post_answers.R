#' Posts Answers to a Google Form
#'
#' Posts Answers to a Google Form specified by url or id.
#'
#' @param form  form id or url
#' @param answers vector of answers
#' @export
#' @examples
#' \dontrun{
#' post_answers(form = "form_url",
#'              answers = c("Anything", "you", want))
#' }
post_answers <- function(form, answers){
  entry.ids <- get_form_entry_ids(get_form(form))
  form_url <- make_url(form, "post")
  check_form_works(invisible(
    httr::POST(form_url, query = stats::setNames(as.list(as.character(answers)),
                                                         as.character(entry.ids)))
    ))
}

