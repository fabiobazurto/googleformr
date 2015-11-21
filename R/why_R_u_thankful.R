#' Sends Data back to my Google Form
#'
#' Sends Data back to my Google Form About Being Thankful. gformr creates why_R_u_thankful into a linked function with the form.
#'
#' @param form Can be either the form_url or form_id
#' @export
#' @importFrom magrittr %>%
#' @examples \dontrun{
#' why_R_u_thankful("Aside from divine providence, the humbling, amazing transition I made from asst prof to data scientist was humanly possible bec of R and the opensource community. I love who I am now. I wouldn't go back.")
#' }

why_R_u_thankful <- gformr("https://docs.google.com/forms/d/1Ttl_SGI1cjRHSw_oU7kwxnGESoMwf4BU4NMAqPA-BRs/viewform")


