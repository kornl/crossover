#' Build Summary Table For All Examples From Literature
#' 
#' Build Summary Table For All Examples From Literature
#' 
#' See also the documentation for the data files.
#' 
#' @return TODO
#' @author Kornelius Rohmeyer \email{rohmeyer@@small-projects.de}
#' @references See the documentation for the data files.
#' @keywords misc
#' @examples
#' 
#'   buildSummaryTable()
#' 
#' @export buildSummaryTable
buildSummaryTable <- function() {	
	summaryTable <- data.frame(dataset=character(0), title=character(0), reference=character(0), signature=character(0), t=numeric(0), p=numeric(0), s=numeric(0))
	path <- system.file("data", package="crossover")
	for (file in dir(path=path)) {		 
		designs <- load(paste(path, file, sep="/"), envir=crossover:::crossover.env)
		for (design in designs) {
			dataset <- design
			design <- get(design, envir=crossover:::crossover.env)
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

getSignatureStr <- function(design) {
	p <- dim(design)[1]
	s <- dim(design)[2]
	t <- length(levels(as.factor(design)))
	return(paste("p=",p,", s=",s,",t=",t,sep=""))
}

getSignature <- function(design) {
	p <- dim(design)[1]
	s <- dim(design)[2]
	t <- length(levels(as.factor(design)))
	return(c(p,s,t))
}

#getTable <- function(design) {
#    design <- design2integer(design)#
#	rownames(design) <- paste("p", 1:dim(design)[1], sep="")
	#colnames(design) <- paste("s", 1:dim(design)[2], sep="")
#	return(paste(capture.output(print(xtable(design), type="html")), collapse="\n"))
#}

design2integer <- function(design) {
    return(matrix(as.integer(design), dim(design)[1]))
}

getEff <- function(design) {
	l <- design.efficiency(design)
	return(c(l$av.eff.trt.pair, l$av.eff.trt.pair.adj))
}

crossoverVersion <- function() {
	x <- try(as.character(packageVersion("crossover")), silent=TRUE)
	if (class(x)!="try-error") {
		return(x)
	} else {
		return("unknown")
	}
}
