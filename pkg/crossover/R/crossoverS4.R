## Graph representation in gMCP
setClass("crossoverDesign",	
		representation(design="matrix", 
				s="numeric", p="numeric", v="numeric", 
        model="numeric",
        description="character",
				attr="list", 
				misc="list"),
		validity=function(object) validDesign(object))

setMethod("initialize", "crossoverDesign",
		function(.Object, design, v, model, description="", attr=list(), misc=list()) {			
			if (missing(design)) {			
				stop("Please specify missing design.")
			}						
			.Object@design <- design
      if (missing(v)) {
        v <- length(levels(as.factor(design)))
      }
			.Object@v <- v
      .Object@s <- dim(design)[1]
			.Object@p <- dim(design)[2]
      if (!missing(model)) {
        .Object@model <- model
      }
			.Object@description <- description
			.Object@attr <- attr
			.Object@misc <- misc      
			validObject(.Object)
			return(.Object)
		})

validDesign <- function(object) {
	if (max(length(object@s),length(object@p),length(object@v))>1) return(FALSE)
	return(TRUE)
}

setMethod("print", "crossoverDesign",
          function(x, ...) {
            callNextMethod(x, ...)
          })

setMethod("show", "crossoverDesign",
          function(object) {
            # callNextMethod(x, ...)            
            cat(paste(object@description, " (s=", object@s, ", p=",  object@p, ", v=",  object@v ,")\n", sep=""))
            print(object@design)
            cat("\n")
            if (length(object@model)>0) {
              print(general.carryover(object@design, model=object@model))
            }
          })


setClass("crossoverSearchResult",		
		representation(design="crossoverDesign",
        startDesigns="list",
		    model="numeric",
				eff="list",
				search="list",
				time="numeric",
        misc="list")
)

setMethod("print", "crossoverSearchResult",
		function(x, ...) {
			callNextMethod(x, ...)
		})

setMethod("show", "crossoverSearchResult",
		function(object) {
			# callNextMethod(x, ...)
			cat("Crossover Search Result\n")			
			cat("\nDesign:\n")
			print(object@design)
			
		})

setMethod("plot", c(x="crossoverSearchResult", y="missing") ,
          function(x, y, ...) { #function(x, type=1, show.jumps=FALSE) {
            type<-1; show.jumps<-FALSE
            eff <- unlist(x@eff)
            run <- as.factor(rep(1:length(x@eff), each=length(x@eff[[1]])))
            n <- 1:(length(x@eff[[1]])*length(x@eff))
            n2 <- rep(1:length(x@eff[[1]]), times=length(x@eff))
            d <- data.frame(eff=eff, run=run, n=n, n2=n2)
            n <- x@search$n
            jumps <- x@search$jumps
            if (type==1) {
              plot <- ggplot(d, aes(x=n, y=eff, colour=run)) + geom_point()
              if (show.jumps) plot <- plot + geom_vline(xintercept = 1:((n[1]*n[2])/jumps[2])*jumps[2], colour=grey)
            } else {
              plot <-ggplot(d, aes(x=n2, y=eff)) + geom_point(colour="#444499", size=1) + geom_abline(intercept = max(d$eff), slope = 0) + facet_wrap( ~ run)
            }
            plot <- plot + xlab("Simulation run") + ylab("E")
            return(plot)
          }
)

setGeneric("getNodes", function(object, ...) standardGeneric("getNodes"))

setMethod("getNodes", c("crossoverSearchResult"),
		function(object, ...) {			
			return(rownames(object@m))
		})