#' Gets and Prints Form Questions and Entry.Ids
#'
#' Gets and Prints Form Questions and Entry.Ids.
#'
#' @param form The url to your form
#' @export
#' @examples
#' \dontrun{
#' get_form_str("url_to_your_form")
#' }
get_form_str <- function(form){
  message("\tOrder your post content\n\taccording to the Questions on Form")
  form <- get_form(form)
  entry.ids <- get_form_entry_ids(form)
  entry.qs <- get_form_questions(form)
  cbind(entry.qs, entry.ids)
}

