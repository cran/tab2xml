#' Create a `sheet2xml` S3 Object
#'
#' This function initializes an object of class `sheet2xml`, which processes spreadsheet files
#' (Excel `.xlsx` or OpenDocument `.ods`) and their corresponding XML templates.
#'
#' @param file_path A character string specifying the path to the spreadsheet file.
#' @param template_path A character string specifying the path to the main XML template.
#' @param xml_path (Optional) A character string specifying the output XML file path.
#'   If not provided, it defaults to the same path as `file_path` with an `.xml` extension.
#'
#' @return An object of class `sheet2xml`, which is a list containing:
#'   - `xml_path`: The path for the generated XML file.
#'   - `root`: The root template configuration.
#'   - `sheets`: A named list of data frames containing spreadsheet data.
#'   - `templates`: A named list of XML template structures.
#'
#' @details
#' - Supports `.xlsx` files (using `readxl`) and `.ods` files (using `readODS`).
#' - Converts all sheet names and column names to lowercase for consistency.
#' - Reads individual XML templates for each sheet from the same directory as `template_path`.
#' - Converts tokens to lowercase for consistency.
#'
#' @keywords internal
#' @noRd
new_sheet2xml <- function(file_path, template_path, xml_path = NULL) {

  sheets_data <- get_sheets_data(file_path)
  sheet_names <- names(sheets_data)

  if (is.null(xml_path)) {
    xml_path <- paste0(tools::file_path_sans_ext(file_path), ".xml")
  }

  sheets_template <- list()

  # get original template names
  dir <- dirname(template_path)

  all_files <- list.files(dir, full.names = TRUE)
  file_names_actual <- basename(all_files)
  file_names_actual_lower <- tolower(file_names_actual)

  templates <- paste0(dir, '/', sheet_names, '.xml')
  templates <- c(template_path, templates)

  matched_files <- all_files[match(basename(templates), file_names_actual_lower, nomatch = 0)]

  # read templates (with original names)
  sheets_template <- lapply(matched_files, read_template)
  names(sheets_template) <- c('__config__', sheet_names)

  sheets_template <- lapply(sheets_template, convert_tokens_lowercase)

  structure(
    list(
      xml_path = xml_path,
      root = sheets_template[[1]],
      sheets = sheets_data,
      templates = sheets_template[-1]
    ),
    class = "sheet2xml"
  )
}



#' Retrieve Data from an Excel or ODS File
#'
#' Reads all sheets from a given `.xlsx` or `.ods` file and returns a list
#' of data frames, ensuring all column names are converted to lowercase.
#'
#' @param file_path A character string specifying the path to the Excel (`.xlsx`)
#' or ODS (`.ods`) file.
#'
#' @return A named list of data frames, where each element corresponds to a sheet
#' from the input file. Column names are converted to lowercase.
#'
#' @keywords internal
#' @noRd
get_sheets_data <- function(file_path) {
  if (!file.exists(file_path)) {
    stop("The file does not exist: ", file_path)
  }

  extension <- tools::file_ext(file_path)
  sheets_data <- list()

  if (extension == "xlsx") {
    sheet_names <- readxl::excel_sheets(file_path)
    sheets_data <- lapply(sheet_names, function(sheet)
      readxl::read_excel(file_path, sheet = sheet, col_types = "text"))

  } else if (extension == "ods") {
    sheet_names <- readODS::ods_sheets(file_path)
    sheets_data <- lapply(seq_along(sheet_names), function(sheet)
      readODS::read_ods(file_path, sheet = sheet, col_types = NA))

  } else {
    stop("Unsupported format. Use a .xlsx or .ods file.")
  }

  names(sheets_data) <- tolower(sheet_names)

  sheets_data <- lapply(sheets_data, function(df) {
    colnames(df) <- tolower(colnames(df))
    return(df)
  })

  sheets_data
}
