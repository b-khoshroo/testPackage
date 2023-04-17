#' Constructor for Rttest object
#'
#' @param x a vector
#' @param y a vector
#' @param alpha thr ttest parameter
#' @importFrom stats t.test
#'
#' @return an object of Rttest class
#' @export
#'
#' @examples
#' \dontrun{obj <- new_Rttest(x,y, 0.05)}
#'
new_Rttest <- function(x,y,alpha)
{
  # handeling unequal length of x and y if needed:
  if (length(x) > length(y))
  {
    y <- c(y, rep(NA,(length(x)-length(y))))
  } else if (length(y) > length(x))
  {
    x <- c(x, rep(NA,(length(y)-length(x))))
  }

  # running a ttest, assuming that the variances are the same
  t <- t.test(x, y, var.equal = TRUE)

  #creating the object/list:
  object = list(
    data = data.frame(x,y),
    test = t,
    alpha = alpha,
    confidence_interval = t$conf.int,
    p_value = t$p.value
  )

  class(object) <- "Rttest" #attributing the class Rttest to the object

  object #returning the object
}
