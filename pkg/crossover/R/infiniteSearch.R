infiniteSearch <- function(oldResult=NULL, ..., start.designs) {
    if (is.null(oldResult)) {
        result <- searchCrossOverDesign(start.designs=start.designs, ...)
        return(result)
    }
    result <- searchCrossOverDesign(start.designs=list(getDesign(oldResult)), ...)
    return(combineResults(oldResult, result))
}

combineResults <- function(x,y) {    
    return(new("crossoverSearchResult", 
               design=y@design, 
               startDesigns=c(x@startDesigns, y@startDesigns), 
               eff=c(x@eff, y@eff),                   
               search=x@search, 
               model=c(x@model, y@model), 
               time=c(x@time, y@time), 
               misc=c(x@misc, y@misc)))
    
}

getMaxEffPerRun <- function(x) {
    return(unlist(lapply(x@eff, function(x) {max(x[!is.na(x)])})))
}