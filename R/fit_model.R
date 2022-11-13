slr <- function(outcome, covariate, data){
  if (sum(complete.cases(data))!=length(data)){
    return(print('Error: data contains NA values'))
  } else{
    #outcome <- 'Depression'
    #covariate <- 'Fatalism'
    #data <- stroke
    x <- data[,covariate]
    y <- data[,outcome]
    Xbar <- mean(X)
    Ybar <- mean(Y)
    n <- length(X)
    SSXY = sum((Y - Ybar) * (X - Xbar))
    SSX = sum((X - Xbar)^2)
    SSY = sum((Y - Ybar)^2)
    # calculate beta0 and beta1
    beta1hat <- SSXY/SSX
    beta0hat <- Ybar - beta1hat * Xbar
    # predict outcome
    Yhat <- beta0hat + beta1hat * complete$Fatalism
    #calculate SSE and SSR
    SSE <- sum((Y - Yhat)^2)
    MSE <- SSE/(n - 2)
    SSR <- sum((Yhat - Ybar)^2)
    MSR <- SSR/1
    # Obtain t-statistics and p-values for beta0 and beta1
    T_beta1 <- (beta1hat - 0)/(sqrt(MSE)/sqrt(SSX))
    p_beta1 <- 2 * pt(q = T_beta1, df = (n - 2), lower.tail = F)
    # Obtain the T statistics and the p-value for H0: beta1=0
    T_beta0 <- (beta0hat - 0)/(sqrt(MSE * (1/n + Xbarˆ2/SSX)))
    p_beta0 <- 2 * pt(q = T_beta0, df = (n - 2), lower.tail = F)
    #get the F statistics for the whole model
    # Calculate R-square
    R_square <- SSR/SSY
    # Obtain the F statistics and the p-value for H0: beta1=0 
    Fstatistic <- MSR/MSE
    p_value <- pf(Fstatistic, df1 = 1, df2 = (n - 2), lower.tail = F)
    #add a function
    sign <- function(p){
     stars <- ifelse(p<0.001,'***',ifelse(p<0.01,'**',ifelse(p<0.05,'*',' '))) 
     return(stars)
     }
    coefficient.tbl <- data.frame(Estimate=c(beta0hat,beta1hat),
                                  t.stat=c(T_beta0,T_beta1),
                                  p.value=c(p_beta0,p_beta1),
                                  significance=c(sign(p_beta0),sign(p_beta1)))
  }}
# example to use this function :
# fitted <- fit_model(Depression ~ Age + Sex + R_E + Education + Htn + HiChol + Afib + Cad + Db +Fatalism, stroke)
