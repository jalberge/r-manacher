#' Manacher's Algorithm
#'
#' Finds the longest palindromic substring in a given string using Manacher's algorithm.
#'
#' @param s A character string.
#' @return A character string representing the longest palindromic substring.
#' @export
manacher <- function(s) {
  # Transform the original string to avoid even/odd length issues
  t <- paste0("#", paste(strsplit(s, NULL)[[1]], collapse = "#"), "#")
  n <- nchar(t)
  p <- integer(n)
  c <- 0
  r <- 0

  for (i in seq_len(n)) {
    mirr <- 2 * c - i
    if (i < r) {
      p[i] <- min(r - i, p[mirr])
    }

    # Attempt to expand the palindrome centered at i
    while (i + p[i] + 1 <= n && i - p[i] - 1 > 0 &&
           substr(t, i + p[i] + 1, i + p[i] + 1) == substr(t, i - p[i] - 1, i - p[i] - 1)) {
      p[i] <- p[i] + 1
    }

    # If the palindrome centered at i expands past r, adjust center and r
    if (i + p[i] > r) {
      c <- i
      r <- i + p[i]
    }
  }

  # Find the maximum element in p
  max_len <- max(p)
  center_index <- which.max(p)

  # Extract the longest palindromic substring
  start <- (center_index - max_len) / 2
  return(substr(s, start + 1, start + max_len))
}
