buildSummaryTable <- function() {	
	summaryTable <- data.frame(dataset=character(0), title=character(0), reference=character(0), signature=character(0), t=numeric(0), p=numeric(0), s=numeric(0))
	path <- system.file("data", package="crossover")
	for (file in dir(path=path)) {		 
		designs <- load(paste(path, file, sep="/"))
		for (design in designs) {
			dataset <- design
			design <- get(design)
			title <- attr(design, "title")
			reference <- attr(design, "reference")
			signature <- attr(design, "signature")
			p <- dim(design)[1]
			s <- dim(design)[2]
			t <- length(levels(as.factor(design)))			
			summaryTable <- rbind(summaryTable, 
					data.frame(dataset=dataset, title=title, reference=reference, signature=signature, t=t, p=p, s=s))
		}
	}
	summaryTable$dataset <- as.character(summaryTable$dataset)
	summaryTable$title <- as.character(summaryTable$title)
	summaryTable$signature <- as.character(summaryTable$signature)
	summaryTable$reference <- as.character(summaryTable$reference)
	return(summaryTable)
}

loadAllDatasets <- function() {
	path <- system.file("data", package="crossover")
	for (file in dir(path=path)) {		 
		designs <- load(paste(path, file, sep="/"), envir=globalenv())
	}
}