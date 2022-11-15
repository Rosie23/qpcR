#' Gets your raw qPCR data from xls file
#'
#' @param file_name file name of your xls qPCR data
#' @param ct_skip_rows Number of rows to skip before header of Results table (default = 7)
#' @param ct_sheet Excel sheet number Results table is on with raw Ct results (default = 2)
#' @param amp_skip_rows Number of rows to skip before header of Amplification table (default = 7)
#' @param amp_sheet Excel sheet number Amplification data is on (default = 5)
#' @param meltcurve_skip_rows Number of rows to skip before header of Meltucurve table (default = 7)
#' @param meltcurve_sheet Excel sheet number Meltcurve data is on (default = 9)
#' @param amp_data Do you have amplification data to include (TRUE/FALSE)
#' @param meltcurve_data Do you have meltcurve data to include (TRUE/FALSE)
#'
#' @return A list of results tables as tibbles; table with raw Ct values, table with amplification values, table with meltcurve values
#' @export
#'
#' @examples
#' my_data <- get_raw_data("extdata/test.xls")
get_raw_data <- function(file_name,
                         ct_skip_rows = 7, ct_sheet = 2,
                         amp_skip_rows = 7, amp_sheet = 5,
                         meltcurve_skip_rows = 7, meltcurve_sheet = 9,
                         amp_data=TRUE, meltcurve_data = TRUE){
  if(amp_data){
    amp_data = readxl::read_xls(file_name, skip=amp_skip_rows, sheet=amp_sheet)
  } else amp_data = "Not avaliable"

  if(meltcurve_data){
    meltcurve_data =  readxl::read_xls(file_name, skip=meltcurve_skip_rows, sheet=meltcurve_sheet)
  } else meltcurve_data = "Not avaliable"

  raw_data <- tibble::lst(
    ct_data = readxl::read_xls(file_name, skip=ct_skip_rows, sheet=ct_sheet),
    amp_data = amp_data,
    multcurve_data = meltcurve_data
  )
}
