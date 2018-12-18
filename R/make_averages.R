#'@title make_averages
#'@description make averages, sd and se for given variables ~ treatments
#'@param dataframe name of the dataframe containing the data
#'@param params concatenated character string of dataframe column name(s) containing the parameters to average
#'@param treatments concatenated character string of dataframe colmnn name(s) containing treatments to average
#'@return dataframe containing averages, sd and se per parameter against each level of the treatments, with a final count column
#'@export

make_averages <- function(dataframe = NA, params = NA, treatments = NA){

  my.treats <- paste(treatments, collapse='+')

  for(i in 1:length(params)){
    form <- paste(params[i], '~', my.treats)

    if(i == 1){ #for first instance, to initiate aggregated data frame
    x <- aggregate(as.formula(form), data=dataframe, FUN = mean, na.action = NULL, na.rm = T)
    my.count <- aggregate(as.formula(form), data=dataframe, FUN = length, na.action = NULL, na.rm = T)[,length(treatments)+1]
    sd.nam <- paste(params[i], 'sd', sep='_')
    x[,sd.nam] <- aggregate(as.formula(form), data=dataframe, FUN = sd, na.action = NULL, na.rm = T)[,length(treatments)+1]
    se.nam <- paste(params[i], 'se', sep='_')
    x[,se.nam] <- x[,sd.nam] / sqrt(my.count)
    } else {
      param.nam <- params[i]
      x[,param.nam] <- aggregate(as.formula(form), data=dataframe, FUN = mean, na.action = NULL, na.rm = T)[,length(treatments)+1]
      sd.nam <- paste(params[i], 'sd', sep='_')
      x[,sd.nam] <- aggregate(as.formula(form), data=dataframe, FUN = sd, na.action = NULL, na.rm = T)[,length(treatments)+1]
      se.nam <- paste(params[i], 'se', sep='_')
      x[,se.nam] <- x[,sd.nam] / sqrt(my.count)
    }

    if(i == length(params)){
      x$count <- my.count
    }
  }#end of i loop

return(x)

}#end of function
