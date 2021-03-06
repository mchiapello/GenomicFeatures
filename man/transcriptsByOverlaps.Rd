\name{transcriptsByOverlaps}

\alias{transcriptsByOverlaps}
\alias{transcriptsByOverlaps,TxDb-method}
\alias{exonsByOverlaps}
\alias{exonsByOverlaps,TxDb-method}
\alias{cdsByOverlaps}
\alias{cdsByOverlaps,TxDb-method}

\title{
  Extract genomic features from a TxDb-like object based on their
  genomic location
}
\description{
  Generic functions to extract genomic features for specified genomic
  locations.
  This page documents the methods for \link{TxDb} objects only.
}
\usage{
transcriptsByOverlaps(x, ranges,
                      maxgap = -1L, minoverlap = 0L,
                      type = c("any", "start", "end"), ...)
\S4method{transcriptsByOverlaps}{TxDb}(x, ranges,
                      maxgap = -1L, minoverlap = 0L,
                      type = c("any", "start", "end"),
                      columns = c("tx_id", "tx_name"))

exonsByOverlaps(x, ranges,
                maxgap = -1L, minoverlap = 0L,
                type = c("any", "start", "end"), ...)
\S4method{exonsByOverlaps}{TxDb}(x, ranges,
                maxgap = -1L, minoverlap = 0L,
                type = c("any", "start", "end"),
                columns = "exon_id")

cdsByOverlaps(x, ranges,
              maxgap = -1L, minoverlap = 0L,
              type = c("any", "start", "end"), ...)
\S4method{cdsByOverlaps}{TxDb}(x, ranges,
              maxgap = -1L, minoverlap = 0L,
              type = c("any", "start", "end"),
              columns = "cds_id")
}
\arguments{  
  \item{x}{A \link{TxDb} object.}
  \item{ranges}{A \link[GenomicRanges]{GRanges} object to restrict the output.}
  \item{maxgap,minoverlap,type}{
    Used in the internal call to \code{findOverlaps()} to detect overlaps.
    See \code{?\link[IRanges]{findOverlaps}} in the \pkg{IRanges} package
    for a description of these arguments.
  }
  \item{...}{Arguments to be passed to or from methods.}
  \item{columns}{Columns to include in the output.
    See \code{?\link{transcripts}} for the possible values.}
}
\details{
  These functions subset the results of \code{\link{transcripts}},
  \code{\link{exons}}, and \code{\link{cds}} function calls with
  using the results of \code{\link[IRanges]{findOverlaps}}
  calls based on the specified \code{ranges}.
}
\value{ a GRanges object }
\author{
  P. Aboyoun
}
\seealso{
  \itemize{
    \item \code{\link{transcripts}} and \code{\link{transcriptsBy}}
          for more ways to extract genomic features
          from a \link{TxDb}-like object.

    \item \code{\link{transcriptLengths}} for extracting the transcript
          lengths (and other metrics) from a \link{TxDb} object.

    \item \code{\link{exonicParts}} and \code{\link{intronicParts}} for
          extracting non-overlapping exonic or intronic parts from a
          TxDb-like object.

    \item \code{\link{extractTranscriptSeqs}} for extracting transcript
          (or CDS) sequences from chromosome sequences.

    \item \code{\link{coverageByTranscript}} for computing coverage by
          transcript (or CDS) of a set of ranges.

    \item \link[GenomicFeatures]{select-methods} for how to use the
          simple "select" interface to extract information from a
          \link{TxDb} object.

    \item \code{\link{id2name}} for mapping \link{TxDb} internal ids
          to external names for a given feature type.

    \item The \link{TxDb} class.
  }
}
\examples{
txdb <- loadDb(system.file("extdata", "hg19_knownGene_sample.sqlite",
                           package="GenomicFeatures"))
gr <- GRanges(Rle("chr1", 2),
              IRanges(c(500,10500), c(10000,30000)),
              strand = Rle("-", 2))
transcriptsByOverlaps(txdb, gr)
}

\keyword{methods}
