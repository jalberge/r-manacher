#' Manacher's Algorithm for DNA
#'
#' Finds the longest palindromic substring in a given character sequence using Manacher's algorithm.
#' Optionally checks against the reverse complement (dna).
#'
#' @param s A character string representing a DNA sequence.
#' @param dna A logical value indicating whether to check against the reverse complement.
#' @return A character string representing the longest palindromic substring.
#' @export
manacher_dna <- function(s, dna = FALSE) {

  if(dna) {
    # Compute the complement of the sequence as a target not query
    # (reverse is the palindrome)
    # no need to reverse as this is what manacher's algorithm does
    s <- toupper(s)
    if (!grepl("^[ACGT]*$", s)) {
      stop("The sequence contains invalid characters. Only A, C, G, and T are allowed.")
    }
    t.s <- chartr("ACGT", "TGCA", s)
    step <- 2 # only check for even dna
  } else {
    t.s <- s
    step <- 1
  }

  # Transform the sub and target string to avoid even/odd length issues
  q.s <- paste0("|", paste(strsplit(s, NULL)[[1]], collapse = "|"), "|")
  t.s <- paste0("|", paste(strsplit(t.s, NULL)[[1]], collapse = "|"), "|")

  n <- nchar(q.s)
  p <- integer(n)
  c <- 0
  r <- 0

  for (i in seq(1, n, by=step)) {

    mirr <- 2 * c - i

    if (i < r) {
      p[i] <- min(r - i, p[mirr])
    }

    # Attempt to expand the palindrome centered at i
    while (i + p[i] + 1 <= n && i - p[i] - 1 > 0 &&
           substr(q.s, i + p[i] + 1, i + p[i] + 1) == substr(t.s, i - p[i] - 1, i - p[i] - 1)) {
      p[i] <- p[i] + 1
    }

    # If the palindrome centered at i expands past r, adjust center and r
    if (i + p[i] > r) {
      c <- i
      r <- i + p[i]
    }
  }

  max_len <- max(p)
  center_index <- which.max(p)

  # Extract the longest palindromic substring
  start <- (center_index - max_len) / 2
  match <- substr(s, start + 1, start + max_len)
  return(list(center=center_index/2, start=floor( start +1), match=match, length=max_len))
}
