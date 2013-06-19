evaluation <- function() {
  design1 <- t(rbind(c(1,1,2,2),
                     c(2,2,1,1),
                     c(1,1,2,2),
                     c(2,2,1,1),
                     c(1,2,2,1),
                     c(2,1,1,2)))
  design2 <- t(rbind(c(1,1,2,1),
                     c(2,2,1,2),
                     c(1,1,2,1),
                     c(2,2,1,2),
                     c(1,2,2,1),
                     c(2,1,1,2)))
  design3 <- t(rbind(c(1,1,2,2),
                     c(2,2,1,1),
                     c(1,1,2,2),
                     c(2,2,1,1),
                     c(1,1,2,2),
                     c(2,2,1,1)))
  general.carryover(design1, model=1)
  general.carryover(design2, model=1)
  general.carryover(design3, model=1)
  design.efficiency(design1)
  design.efficiency(design2)
  design.efficiency(design3)
}