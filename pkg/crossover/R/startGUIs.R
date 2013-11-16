#' Graphical User Interface for the Creation of SRMTP Graphs
#' 
#' Starts a graphical user interface for the creation of SRMTP graphs.
#' 
#' See the vignette of this package for further details, since describing a GUI
#' interface is better done with a lot of nice pictures.
#' 
#' @return The function itself returns NULL. But from the GUI designs and
#' objects can be created or edited that will be available in R under the
#' specified variable name after saving.
#' @author Kornelius Rohmeyer \email{rohmeyer@@small-projects.de}
#' @keywords misc
#' @examples
#' 
#' 
#' \dontrun{
#' crossoverGUI()
#' }
#' 
#' 
#' @export crossoverGUI
crossoverGUI <- function() {
	invisible(.jnew("org/mutoss/gui/CrossoverGUI"))	
}

getTable <- function(d, type="HTML") {
  d <- design2integer(d)
  rownames(d) <- paste("p", 1:dim(d)[1], sep="")
  colnames(d) <- paste("s", 1:dim(d)[2], sep="")
  if (type=="ASCII") {
    return(paste("<pre>",paste(capture.output(print(d)), collapse="\n"),"</pre>"))
  } else if (type=="HTML") {
    return(print(xtable(d), type="html"))
  } else if (type=="R") {
    return(paste("<pre>",dputMatrix(d),"</pre>"))
  }
}

dputMatrix <- function(m, name, indent=6, rowNames=FALSE) {
  s <- "rbind("
  if (!missing(name)) s <- paste(name,"<- rbind(") 
  for (i in 1:(dim(m)[1])) {
    nameLater <- FALSE
    if (any(make.names(row.names(m))!=row.names(m))) {
      rowNames <- FALSE
      nameLater <- TRUE
    }
    rName <- ifelse(rowNames, paste(row.names(m)[i],"=",sep=""), "")
    s <- paste(s, 
               ifelse(i==1,"",paste(rep(" ",indent),collapse="")),
               rName,
               dputS(unname(m[i,])),
               ifelse(i==dim(m)[1],")\n",",\n"),
               sep="")            
  }
  if (nameLater) {
    if (missing(name)) {
      warning("Can set row names if no name for matrix is given.")
      return(s)
    }
    s <- paste(s, 
               "row.names(",name,") <- ", dputS(row.names(m)), "\n", sep="")
  }
  return(s)
}

dputS <- function(x) {
  paste(capture.output(dput(x)), collapse="\n")
}

isRName <- function(x) {
  return(x==make.names(x))
}