.onLoad <- function(libname, pkgname) {
	if (!.jniInitialized) {
		.jinit(parameters=c("-Xrs","-Xss1m"))
	}
	.jpackage(pkgname)
	.jpackage("JavaGD")
	.jpackage("JGR")
	
	jars <- c(#"afcommons",
			"commons-logging", "forms", 
			"iText", "jhlir.jar", "jxlayer", 
			"log4j", "swing-worker")
	
	loadJars(jars)
	
  # The following few lines are based on the code of the rJava .jpackage function
  classes <- system.file("jri", package = "rJava", lib.loc = NULL)
	if (nchar(classes)) {
		.jaddClassPath(classes)
		jars <- grep(".*\\.jar", list.files(classes, full.names = TRUE), TRUE, value = TRUE)
		if (length(jars)) { 
			.jaddClassPath(jars)
		}		
	}
  
	## we supply our own JavaGD class
	Sys.setenv("JAVAGD_CLASS_NAME"="org/mutoss/gui/JavaGD")  
		
	rJavaVersion <- utils::sessionInfo()$otherPkgs$rJava$Version
	
	if (!is.null(rJavaVersion)) {
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
    
	#TODO How to test for 64-bit R? In the moment I use: .Machine$sizeof.pointer != 8
	#if (length(grep("64-bit", sessionInfo()$platform))==0 || .Machine$sizeof.pointer != 8) {
	#	rversion <- c(sessionInfo()$R.version$major, unlist(strsplit(sessionInfo()$R.version$minor, "\\.")))
	# if ((rversion[1]==2&&rversion[2]==15&&rversion[3]>=2)|| rversion[1]>=3) warning("WARNING: You may experience crashes due to memory problems.\nPlease try to either i) use an old R<=2.15.2 or ii) R with 64-bit on Windows 64.\nWe are working on this problem.\nIf you experience no crashes everything is fine.")
	#}
	
	assign(".summary_table",  buildSummaryTable(), envir=crossover:::crossover.env)
}  

.onAttach <- function(libname, pkgname) {
    packageStartupMessage("************************************************************\n",
                          "* THIS PACKAGE IS AN ALPHA VERSION!                        *\n",
                          "* It may give you good designs or it may make mistakes.    *\n",
                          "* Please check for every design whether it fits your needs.*\n",
                          "************************************************************")
}