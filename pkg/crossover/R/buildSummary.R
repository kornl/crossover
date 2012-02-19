buildSummaryTable <- function() {	
	summaryTable <- data.frame(title=character(0), reference=character(0), signature=character(0), t=numeric(0), p=numeric(0), s=numeric(0))
	path <- system.file("data", package="crossover")
	for (file in dir(path=path)) {
		designs <- load(paste(path, file, sep="/"))
		for (design in designs) {
			design <- get(design)
			title <- attr(design, "title")
			reference <- attr(design, "reference")
			signature <- attr(design, "signature")
			t <- dim(design)[1]
			p <- dim(design)[2]
			s <- length(levels(as.factor(design)))
			summaryTable <- rbind(summaryTable, 
					data.frame(title=t, reference=reference, signature=signature, t=t, p=p, s=s))
		}
	}
	return(summaryTable)
}