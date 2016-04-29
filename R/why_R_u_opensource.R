#' Sends Data back to my Google Form
#'
#' Sends Data back to my Google Form About Being opensource. gformr creates why_R_u_opensource into a linked function with the form.
#'
#' @param post_content the option of the function returned from gformr
#' @param active an option to make the function active or not
#' @export
#' @examples
#' \dontrun{
#' why_R_u_opensource(post_content = "the opensource community is helpful")
#' }

why_R_u_opensource <- gformr(form = "https://docs.google.com/forms/d/1Ttl_SGI1cjRHSw_oU7kwxnGESoMwf4BU4NMAqPA-BRs/viewform",
                           custom_reply = "Thanks for being open!")


