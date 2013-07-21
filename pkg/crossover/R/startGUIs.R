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
