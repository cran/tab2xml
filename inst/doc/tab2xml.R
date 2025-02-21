## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo=FALSE---------------------------------------------------------------
library(xml2)

source_xml <- system.file("extdata", "schema_original.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)


## ----echo=FALSE, results='asis'-----------------------------------------------
cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----echo=FALSE, results='asis'-----------------------------------------------
source_xml <- system.file("extdata", "schema_template.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----echo=FALSE, results='asis'-----------------------------------------------
library(tab2xml)

source_xlsx <- system.file("extdata", "schema.xlsx", package = "tab2xml")

data <- readxl::read_excel(source_xlsx, sheet = "Cube")
print(knitr::kable(data))

## ----echo=FALSE, results='asis'-----------------------------------------------
source_xml <- system.file("extdata", "Cube.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----echo=FALSE, results='asis'-----------------------------------------------
data <- readxl::read_excel(source_xlsx, sheet = "Table")
print(knitr::kable(data))

## ----echo=FALSE, results='asis'-----------------------------------------------
source_xml <- system.file("extdata", "Table.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----echo=FALSE, results='asis'-----------------------------------------------
data <- readxl::read_excel(source_xlsx, sheet = "Dimension")
print(knitr::kable(data))

## ----echo=FALSE, results='asis'-----------------------------------------------
source_xml <- system.file("extdata", "Dimension.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----echo=FALSE, results='asis'-----------------------------------------------
data <- readxl::read_excel(source_xlsx, sheet = "Hierarchy")
print(knitr::kable(data))

## ----echo=FALSE, results='asis'-----------------------------------------------
source_xml <- system.file("extdata", "Hierarchy.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----echo=FALSE, results='asis'-----------------------------------------------
data <- readxl::read_excel(source_xlsx, sheet = "Level")
print(knitr::kable(data))

## ----echo=FALSE, results='asis'-----------------------------------------------
source_xml <- system.file("extdata", "Level.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----echo=FALSE, results='asis'-----------------------------------------------
data <- readxl::read_excel(source_xlsx, sheet = "Measure")
print(knitr::kable(data))

## ----echo=FALSE, results='asis'-----------------------------------------------
source_xml <- system.file("extdata", "Measure.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----echo=FALSE, results='asis'-----------------------------------------------
data <- readxl::read_excel(source_xlsx, sheet = "CalculatedMember")
print(knitr::kable(data))

## ----echo=FALSE, results='asis'-----------------------------------------------
source_xml <- system.file("extdata", "CalculatedMember.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----echo=FALSE, results='asis'-----------------------------------------------
data <- readxl::read_excel(source_xlsx, sheet = "CalculatedMemberProperty")
print(knitr::kable(data))

## ----echo=FALSE, results='asis'-----------------------------------------------
source_xml <- system.file("extdata", "CalculatedMemberProperty.xml", package = "tab2xml")

xml_content <- readLines(source_xml, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

## ----example------------------------------------------------------------------
library(tab2xml)

# Define file paths
source_xml <- system.file("extdata", "schema_template.xml", package = "tab2xml")
source_xlsx <- system.file("extdata", "schema.xlsx", package = "tab2xml")
temp_file <- tempfile(fileext = ".xml")

# Convert spreadsheet to XML
file <- sheet2xml(source_xlsx, source_xml, temp_file)

## ----results='asis'-----------------------------------------------------------
library(xml2)

xml_content <- readLines(file, warn = FALSE)

cat("```xml\n", paste(xml_content, collapse = "\n"), "\n```", sep = "")

