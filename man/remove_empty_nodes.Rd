% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{remove_empty_nodes}
\alias{remove_empty_nodes}
\title{Remove Empty XML Nodes Recursively}
\usage{
remove_empty_nodes(node)
}
\arguments{
\item{node}{An XML node of class `xml_node` from the `xml2` package.}
}
\value{
The function modifies the XML structure in place and does not return a value.
}
\description{
This function traverses an XML node and removes any empty child nodes.
A node is considered empty if it has no children, no text content, and no attributes.
}
\keyword{internal}
