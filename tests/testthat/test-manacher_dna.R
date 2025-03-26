library(testthat)

test_that("manacher_dna finds longest palindromic substring", {

  # in normal mode
  expect_equal(manacher_dna("TTTAATAGCTTTCGA", dna = FALSE), list(center=11, start=7, match="AGCTTTCGA", length=9))
  expect_equal(manacher_dna("CG", dna = FALSE), list(center=1, start=1, match="C", length=1))
  expect_equal(manacher_dna("CGG", dna = FALSE), list(center=2.5, start=2, match="GG", length=2))
  expect_equal(manacher_dna("A", dna = FALSE), list(center=1, start=1, match="A", length=1))
  expect_equal(manacher_dna("", dna = FALSE), list(center=0.5, start=1, match="", length=0))
  expect_equal(manacher_dna("bkayak", dna = FALSE), list(center=4, start=2, match="kayak", length=5))

  expect_error(manacher_dna("hello!", dna = TRUE))
  expect_equal(manacher_dna("cgcg", dna = TRUE), list(center=2.5, start=1, match="CGCG", length=4))

  # Check the reverse complement case.
  # Here it does not make sense to have a single nuc as the center
  # We simply removed centers from the manacher's solutions that are nucleotides
  # because a single nucleotide (or the center nucleotide of a palindrome) cannot be it's own revcomp
  expect_equal(manacher_dna("A", dna = TRUE), list(center=0.5, start=1, match="", length=0))
  expect_equal(manacher_dna("CC", dna = TRUE), list(center=0.5, start=1, match="", length=0))
  expect_equal(manacher_dna("GCC", dna = TRUE), list(center=1.5, start=1, match="GC", length=2))
  expect_equal(manacher_dna("GCCC", dna = TRUE), list(center=1.5, start=1, match="GC", length=2))
  expect_equal(manacher_dna("", dna = TRUE), list(center=0.5, start=1, match="", length=0))

  expect_equal(manacher_dna("TACGTT", dna = TRUE), list(center=3.5, start=2, match="ACGT", length=4))
  expect_equal(manacher_dna("AAAAAAAAAAATT", dna = TRUE), list(center=11.5, start=10, match="AATT", length=4))

  expect_equal(manacher_dna("ATATGGGGGGGGGGGGGGGCGCGCGCGCCCGGGAAAAAAAAA", dna = TRUE), list(center=23.5 , start=17, match="GGGCGCGCGCGCCC", length=14) )
  expect_equal(manacher_dna("TACGTACGTTT", dna = TRUE), list(center=5.5 , start=2, match="ACGTACGT", length=8) )

})
