#TODO Include remarks from http://stackoverflow.com/questions/31380593/include-tests-in-binary-r-package
## Adapted and extended from the code from http://rwiki.sciviews.org/doku.php?id=developers:runit
unitTestsCrossover <- function(extended=FALSE, java=FALSE, interactive=FALSE, junitLibrary, outputPath) {
	if(!requireNamespace("testthat", quietly=TRUE)) {
		stop("Please install package testthat to run the unit tests.")
	}
	if (extended) Sys.setenv(CROSSOVER_UNIT_TESTS=paste(Sys.getenv("CROSSOVER_UNIT_TESTS"),"extended"))
	if (interactive) Sys.setenv(CROSSOVER_UNIT_TESTS=paste(Sys.getenv("CROSSOVER_UNIT_TESTS"),"interactive"))
	if (missing(outputPath)) {
		if (Sys.getenv("CROSSOVER_UNIT_TEST_OPATH")=="") {
			Sys.setenv(CROSSOVER_UNIT_TEST_OPATH=getwd())
		}
	} else {
		Sys.setenv(CROSSOVER_UNIT_TEST_OPATH=outputPath)
	}
  
  testthat:::test_package("Crossover")
	
	if (java || "java" %in% strsplit(Sys.getenv("CROSSOVER_UNIT_TESTS"),",")[[1]]) {
		# Test whether junit*.jar is in classpath
		if (!missing(junitLibrary)) {
			.jaddClassPath(junitLibrary)
		}
		if (Sys.getenv("GMCP_JUNIT_LIBRARY")!="") {
			.jaddClassPath(Sys.getenv("GMCP_JUNIT_LIBRARY"))
		}
		#testClass <- .jcall(.jnew("tests/RControlTest"), "Ljava/lang/Class;", method="getClass")
		testClasses <- .jcall(.jnew("tests/TestSuite"), "[Ljava/lang/Class;", method="getClasses", evalArray=FALSE)
		result <- try(.jcall("org.junit.runner.JUnitCore", "Lorg/junit/runner/Result;", method="runClasses", testClasses))
		if (("try-error" %in% class(result))) {
			cat("JUnit 4 is needed for JUnit tests (See http://www.junit.org/).")
			stop("Please specify the path to junit 4 jar file via junitLibrary.")
		}
		if (.jcall(result, "I", "getFailureCount")>0) {
			cat("------------------- JUNIT TEST SUMMARY --------------------\n\n")
			cat(.jcall(.jnew("tests/TestSuite"), "S", method="getResultString", result))
			stop(paste(.jcall(result, "I", "getFailureCount"),"failures in JUnit tests!"))
		} else {
			cat(.jcall(result, "I", "getRunCount"), " Java Unit Tests successful! (Runtime: ",.jcall(result, "J", "getRunTime")/1000," sec)")
		}
	}
}
