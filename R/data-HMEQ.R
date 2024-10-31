#' HMEQ Dataset
#'
#' The HMEQ (Home Equity) dataset contains information used for credit risk modeling.
#' It includes various borrower characteristics and credit history details.
#'
#' @format A data frame with `5960` rows and `13` variables:
#' \describe{
#'   \item{BAD}{Binary variable indicating if the borrower defaulted (1 = default, 0 = no default).}
#'   \item{LOAN}{The requested loan amount in USD.}
#'   \item{MORTDUE}{The amount due on existing mortgage.}
#'   \item{VALUE}{The estimated property value.}
#'   \item{REASON}{Reason for the loan request (e.g., "HomeImp" for home improvement, "DebtCon" for debt consolidation).}
#'   \item{JOB}{Occupational category of the borrower.}
#'   \item{YOJ}{Years at the current job.}
#'   \item{DEROG}{Number of derogatory reports.}
#'   \item{DELINQ}{Number of delinquent credit lines.}
#'   \item{CLAGE}{Age of the oldest credit line in months.}
#'   \item{NINQ}{Number of recent credit inquiries.}
#'   \item{CLNO}{Number of credit lines.}
#'   \item{DEBTINC}{Debt-to-income ratio.}
#' }
#'
#' @source Home Equity Loan dataset, commonly used for credit risk modeling.
#' @examples
#' data(HMEQ)
#' summary(HMEQ)
"HMEQ"
