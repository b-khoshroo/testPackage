#' Title
#'
#' @param x an Rttest object
#' @param ... other parameters
#' @importFrom kableExtra kable
#'
#' @return nothing - prints the input object
#' @export
#'
#' @examples
print.Rttest <- function(x, ...)
{
  kableExtra::kable(x$data)
}
