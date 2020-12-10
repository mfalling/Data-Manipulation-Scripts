get_irr <- function(twoColumnDF){
  # Krippendorf's Alpha
  alpha <- irrCAC::krippen.alpha.raw(twoColumnDF)$est$coeff.val
  # Cohen's Kappa
  kappa <- irr::kappa2(twoColumnDF)$value
  # Gwet's Coefficient
  ac1 <- irrCAC::gwet.ac1.raw(twoColumnDF)$est$coeff.val
  # Store results
  results <- data.frame(alpha, kappa, ac1)
  # Return results
  return(results)
}
