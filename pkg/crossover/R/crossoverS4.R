## Graph representation in gMCP
setClass("crossoverDesign",	
		representation(m="matrix", 
				weights="numeric", 
				nodeAttr="list", 
				edgeAttr="list"),
		validity=function(object) validWeightedGraph(object))

setMethod("initialize", "crossoverDesign",
		function(.Object, m, weights, nodeAttr=list(), edgeAttr=list()) {			
			if (length(weights)) {			
				checkValidWeights(weights)
			}			
			colnames(m) <- rownames(m)
			.Object@m <- m
			names(weights) <- rownames(m)
			.Object@weights <- weights
			.Object@nodeAttr <- nodeAttr
			.Object@edgeAttr <- edgeAttr
			if(is.null(.Object@nodeAttr$rejected)) {
				.Object@nodeAttr$rejected <- rep(FALSE, dim(m)[1])
				names(.Object@nodeAttr$rejected) <- rownames(m)
			}
			validObject(.Object)
			return(.Object)
		})

validWeightedGraph <- function(object) {
	# if (sum(object@weights)>1)
	return(TRUE)
}

setClass("crossoverSearchResult",		
		representation(graphs="list",
				pvalues="numeric",
				alpha="numeric",
				rejected="logical",
				adjPValues="numeric")
)

setMethod("print", "crossoverSearchResult",
		function(x, ...) {
			callNextMethod(x, ...)
			#for (node in getNodes(x)) {
			#	cat(paste(node, " (",ifelse(unlist(nodeAttr(x, node, "rejected")),"rejected","not rejected"),", alpha=",format(unlist(nodeAttr(x, node, "nodeWeight")), digits=4 ,drop0trailing=TRUE),")\n", sep=""))	
			#}
			#cat(paste("alpha=",paste(format(getWeights(x), digits=4 ,drop0trailing=TRUE),collapse="+"),"=",sum(getWeights(x)),"\n", sep=""))			
		})

setMethod("show", "crossoverSearchResult",
		function(object) {
			# callNextMethod(x, ...)
			cat("gMCP-Result\n")			
			cat("\nInitial graph:\n")
			print(object@graphs[[1]])
			cat("\nP-values:\n")
			print(object@pvalues)						
			if (length(object@adjPValues)>0) {
				cat("\nAdjusted p-values:\n")
				print(object@adjPValues)
			}
			cat(paste("\nAlpha:",object@alpha,"\n"))
			if (all(!object@rejected)) {
				cat("\nNo hypotheses could be rejected.\n")				
			} else {
				cat("\nHypothesis rejected:\n")
				print(object@rejected)
			}
			if (length(object@graphs)>1) {
				cat("\nFinal graph after", length(object@graphs)-1 ,"steps:\n")
				print(object@graphs[[length(object@graphs)]])
			}			
		})

setMethod("plot", "crossoverSearchResult",
		function(x, y, ...) {
			# TODO Show visualization of graph			
		})

setGeneric("getNodes", function(object, ...) standardGeneric("getNodes"))

setMethod("getNodes", c("crossoverSearchResult"),
		function(object, ...) {			
			return(rownames(object@m))
		})