.onLoad <- function(libname, pkgname) {
	.jpackage(pkgname)
	.jpackage("JavaGD")
	
    classes <- system.file("jri", package = "rJava", lib.loc = NULL)
	if (nchar(classes)) {
		.jaddClassPath(classes)
		jars <- grep(".*\\.jar", list.files(classes, full.names = TRUE), TRUE, value = TRUE)
		if (length(jars)) { 
			.jaddClassPath(jars)
		}		
	}
	## we supply our own JavaGD class
	.setenv <- if (exists("Sys.setenv")) Sys.setenv else Sys.putenv
	.setenv("JAVAGD_CLASS_NAME"="org/mutoss/gui/JavaGD")  
		
	rJavaVersion <- utils::sessionInfo()$otherPkgs$rJava$Version
	
	# If we have a rJava version < 0.8-3 load JRIEngine.jar and REngine.jar
	if (!is.null(rJavaVersion)) {
		if (rJavaVersion < "0.8-3") {
			classes <- system.file("R28", package = "CommonJavaJars", lib.loc = NULL)
			if (nzchar(classes)) {
				.jaddClassPath(classes)
				jars <- grep(".*\\.jar", list.files(classes, full.names = TRUE), TRUE, value = TRUE)
				if (length(jars)) { 
					.jaddClassPath(jars)
				}		
			}
		}
		# If we have a rJava version > 0.9-3 load JRIEngine.jar and REngine.jar
		if (rJavaVersion > "0.9-3") {
			classes <- system.file("JRI", package = "CommonJavaJars", lib.loc = NULL)
			if (nzchar(classes)) {
				.jaddClassPath(classes)
				jars <- grep(".*\\.jar", list.files(classes, full.names = TRUE), TRUE, value = TRUE)
				if (length(jars)) { 
					.jaddClassPath(jars)
				}		
			}
		}
	}
}  