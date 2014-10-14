
dput2 <- function(x) {
  paste(capture.output(dput(x)), collapse = " ")
}

subs.treatment <- function(design, new.treatments) {
  x <- matrix(0, dim(design)[1], dim(design)[2])
  for (t in 1:max(design)) {
   x[design==t] <- new.treatments[t] 
  }    
  return(x)
}

# pbib <- clatworthy.r94
# coDesign <- get("williams4t", Crossover:::Crossover.env)

combine.PBIB <- function() {
  # List of PBIB(2):
  # path <- system.file("data", package="Crossover")
  x <- load("pkg/Crossover/data/clatworthy1.rda")
  designs <- c()
  # Available crossover designs:
  summary <- buildSummaryTable()
  summary <- summary[grep("williams", summary$dataset), ]
  for (pbib.name in x) {
    pbib <- get(pbib.name)
    t.per.block <- dim(pbib)[1] # verified with book
    pbib.title <-  attr(pbib, "title")
    cat("  Creating designs for ", pbib.name, "\n")
    coDesigns <- summary[ summary$t==t.per.block, ]
    if (dim(coDesigns)[1]>0) {
      for (row in 1:(dim(coDesigns)[1])) {
        coDesign <- get(coDesigns$dataset[row], envir=Crossover:::Crossover.env)
        coTitle <- coDesigns[row, "title"]
        coReference <- coDesigns[row, "reference"]
        title <- paste(paste("PB2.", tail(strsplit(pbib.title, " ")[[1]], 1), sep=""), "- Design from combining PBIB(2)", pbib.title, "with", coTitle)
        cat("Creating design ", title, "\n")
        design <- c()
        for (col in 1:(dim(pbib)[2])) {
          design <- cbind(design, subs.treatment(coDesign, pbib[, col]))
        }
        print(design)
        design.name <- tolower(paste("pb2.", coDesigns$dataset[row], ".", tail(strsplit(pbib.title, " ")[[1]], 1), sep=""))
        attr(design, "reference") <- paste(coReference, "Clatworthy, Willard H. Tables of two-associate-class partially balanced designs. US Government Printing Office, 1973.", sep="\n")
        attr(design, "signature") <- paste("p=", dim(design)[1],", n=", dim(design)[2],", t=", max(design), sep="")
        attr(design, "title") <- title
        #designI <- as.matrix(as.integer(design), nrow=dim(design)[1])
        #if (!isTRUE(all.equal(max(abs(design - designI)), 0))) stop("Design and DesignI differ!")
        assign(design.name, design)
        designs <- c(designs, design.name)
      }
    } else {
      cat(" == No crossover designs for ",t.per.block," treatments.\n")
    }    
  }
  save(list=designs, file="/home/kornel/pbib2combine.rda")
}