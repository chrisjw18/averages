#'@title make_averages
#'@description make averages, sd and se for given variables ~ treatments
#'@param dataframe name of the dataframe containing the data
#'@param par character string of dataframe column containing PAM par levels
#'@return rlc_results list containing the following dataframes:
#'    1. 'rlcs' containing the original data, with calculate variables (rETR, NPQ, YNPQ, YNO)
#'       and e and p model parameters (a,b,c) and derived parameters (rETRmax, alpha, Ek)
#'
#'    If predict_ul ==T:
#'    2. 'fits' If predict_ul == Tcontaining predicted fit, upper and lower bounds for each
#'       light curve e and p model calculated using predictNLS function
#'
#'    If 'treatment' is provided:
#'    3. 'av_variables' containing averages of rETR, NPQ, YNPQ and YNO per treatment,
#'        including standard deviation and standard error
#'    4. 'av_params' containing averages of rETRmax, alpha, ek and fvfm per treatment,
#'        including standard deviation and standard error
#'    5. 'av_fits' containing e and p fit of etr ~ par with upper and lower bounds per
#'        treatment.
#'@export

make_averages <- function(dataframe = NA, params = NA, treatments = NA){



}
