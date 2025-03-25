#' Reverse Complement of a DNA Sequence
#'
#' Computes the reverse complement of a given DNA sequence.
#'
#' @param dna A character string representing a DNA sequence.
#' @return A character string representing the reverse complement of the DNA sequence.
#' @export
reverse_complement_dna <- function(dna) {
  complement <- chartr("ACGT", "TGCA", dna)
  return(rev(strsplit(complement, NULL)[[1]]) |> paste(collapse = ""))
}
