% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inspect_characterid.R
\name{inspect_characterid}
\alias{inspect_characterid}
\title{Inspect if a string matches an expected pattern}
\usage{
inspect_characterid(code, pattern)
}
\arguments{
\item{code}{A character string containing a SGIC or similar code that should follow a predefined format.}

\item{pattern}{A character string specifying the expected pattern using regular expressions (regex). 
The pattern defines the format `code` should match.}
}
\value{
A logical value: `TRUE` if the code matches the expected pattern, otherwise `FALSE`
}
\description{
Check whether a given string matches a specified pattern using regular expressions (regex). 
The string is assumed to be a code (e.g., a SGIC), which should follow a predefined format.
}
\examples{
inspect_characterid("ABC1234", "^[A-Za-z]{3}[0-9]{4}$") #TRUE - Matches the pattern
inspect_characterid("12DBG45FG", "^[A-Za-z]{3}[0-9]{4}$") #FALSE - Does not match the pattern
}
