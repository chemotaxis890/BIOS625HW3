#' @title slr
#' @description Simple Linear Regression (SLR) is to estimate the effect of a single input variable on an interested outcome variable in an observed data set.  
#' @param outcome.str The string of the name of a numeric outcome variable in the dataset, e.g., 'Depression'
#' @param covariate.str The string of the name of a numeric input variable in the dataset, e.g., 'Age'
#' @param data A data frame containing the selected variables in the model.
#' @return A seven-object list of the fitted model parameters, including the formula, a coefficient table, R-squared, F-statistics, degrees of freedom and the p-value.
#' @details Can use the existing data `stroke` and select input and outcome variables to try this function out. Also remember that no NA should exist in the selected variables, otherwise the data needs imputation.
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  fitted <- slr('Depression','Age',stroke)
#'  }
#' }
#' @rdname slr
#' @export 
slr <- function(outcome.str, covariate.str, data){
  if (sum(complete.cases(data))!=nrow(data)){
    return(print('Error: data contains NA values'))
  } else{
    #outcome.str <- 'Depression'
    #covariate.str <- 'Fatalism'
    #data <- stroke
    x <- data[,covariate.str]
    y <- data[,outcome.str]
    xbar <- mean(x)
    ybar <- mean(y)
    n <- length(x)
    SSxy = sum((y - ybar) * (x - xbar))
    SSx = sum((x - xbar)^2)
    SSy = sum((y - ybar)^2)
    # calculate beta0 and beta1
    beta1hat <- SSxy/SSx
    beta0hat <- ybar - beta1hat * xbar
    # predict outcome.str
    yhat <- beta0hat + beta1hat * x
    #calculate SSE and SSR
    SSE <- sum((y - yhat)^2)
    MSE <- SSE/(n - 2)
    SSR <- sum((yhat - ybar)^2)
    MSR <- SSR/1
    # Obtain t-statistics and p-values for beta0 and beta1
    T_beta1 <- (beta1hat - 0)/(sqrt(MSE)/sqrt(SSx))
    p_beta1 <- 2 * pt(q = T_beta1, df = (n - 2), lower.tail = F)
    # Obtain the T statistics and the p-value for H0: beta1=0
    T_beta0 <- (beta0hat - 0)/(sqrt(MSE * (1/n + xbar^2/SSx)))
    p_beta0 <- 2 * pt(q = T_beta0, df = (n - 2), lower.tail = F)
    #get the F statistics for the whole model
    # Calculate R-square
    R_squared <- SSR/SSy
    # Obtain the F statistics and the p-value for H0: beta1=0 
    Fstatistic <- MSR/MSE
    p_value <- pf(Fstatistic, df1 = 1, df2 = (n - 2), lower.tail = F)
    #add a function for significance
    sign <- function(p){
     stars <- ifelse(p<0.001,'***',ifelse(p<0.01,'**',ifelse(p<0.05,'*',' '))) 
     return(stars)
     }
    coefficient.tbl <- data.frame(Estimate=c(beta0hat,beta1hat),
                                  t.stat=c(T_beta0,T_beta1),
                                  p.value=c(p_beta0,p_beta1),
                                  significance=c(sign(p_beta0),sign(p_beta1)))
    rownames(coefficient.tbl) <- c('(intercept)',covariate.str)
    call <- paste0(outcome.str,'~',covariate.str)
    return(list(formula=call,
                coefficient=coefficient.tbl,
                R_squared=R_squared,
                F_statistic=Fstatistic,
                F_df1=1,
                F_df2=n-2,
                F_p_value=p_value))
  }}
# example to use this function :
# fitted <- slr('Depression','Fatalism',stroke)
