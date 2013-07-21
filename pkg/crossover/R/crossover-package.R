

#' Class crossoverDesign
#' 
#' A S4 class for crossover designs: crossoverDesign
#' 
#' 
#' @name crossoverDesign-class
#' @aliases crossoverDesign-class crossoverDesign show,crossoverDesign-method
#' print,crossoverDesign-method
#' @docType class
#' @section Slots: \describe{ \item{list("design")}{ Matrix }\item{:}{ Matrix }
#' \item{list("s")}{ Number of sequences. }\item{:}{ Number of sequences. }
#' \item{list("p")}{ Number of periods. }\item{:}{ Number of periods. }
#' \item{list("v")}{ Number of treatments. }\item{:}{ Number of treatments. }
#' \item{list("model")}{ A numeric specifying the model the design was searched
#' for or -1 if unknown. }\item{:}{ A numeric specifying the model the design
#' was searched for or -1 if unknown. } \item{list("description")}{ Optional
#' description of design or reference. }\item{:}{ Optional description of
#' design or reference. } \item{list("attr")}{ List with attributes. }\item{:}{
#' List with attributes. } \item{list("misc")}{ List with miscellaneous stuff -
#' not used yet. }\item{:}{ List with miscellaneous stuff - not used yet. } }
#' @author Kornelius Rohmeyer \email{rohmeyer@@small-projects.de}
#' @keywords graphs
#' @examples
#' 
#' 
#' design <- t(rbind(c(1,1,2,2),
#'                   c(2,2,1,1),
#'                   c(1,1,2,2),
#'                   c(2,2,1,1),
#'                   c(1,2,2,1),
#'                   c(2,1,1,2)))
#'                    
#' new("crossoverDesign", design)
#' 
#' 
NULL





#' This package provides more than two hundred cross-over design from
#' literature, a search algorithm to find efficient cross-over designs for
#' various models and a graphical user interface to find/generate appropriate
#' designs.
#' 
#' This package provides more than two hundred cross-over design from
#' literature, a search algorithm to find efficient cross-over designs for
#' various models and a graphical user interface to find/generate appropriate
#' designs.
#' 
#' 
#' @name crossover-package
#' @docType package
#' @author %Kornelius Rohmeyer, Byron Jones
#' 
#' Maintainer: Kornelius Rohmeyer \email{rohmeyer@@small-projects.de}
#' @references Jones, B., & Kenward, M. G. (2003). Design and analysis of
#' cross-over trials (Vol. 98). Chapman & Hall.
#' 
#' John, J. A., Russell, K. G., & Whitaker, D. (2004). CrossOver: an algorithm
#' for the construction of efficient cross-over designs. Statistics in
#' medicine, 23(17), 2645-2658.
#' @keywords package htest
NULL





#' Class crossoverSearchResult
#' 
#' A S4 class for the search result for crossover designs:
#' crossoverSearchResult
#' 
#' 
#' @name crossoverSearchResult-class
#' @aliases crossoverSearchResult-class crossoverSearchResult
#' show,crossoverSearchResult-method print,crossoverSearchResult-method
#' @docType class
#' @section Slots: \describe{ \item{list("design")}{An object of class
#' \code{crossoverDesign} describing the best design that was
#' found.}\item{:}{An object of class \code{crossoverDesign} describing the
#' best design that was found.} \item{list("startDesigns")}{A list of start
#' designs to search from.}\item{:}{A list of start designs to search from.}
#' \item{list("model")}{A numeric specifying the model the design was searched
#' for or -1 if unknown.}\item{:}{A numeric specifying the model the design was
#' searched for or -1 if unknown.} \item{list("eff")}{List, Progress of the
#' algorithm. TODO: Explain further.}\item{:}{List, Progress of the algorithm.
#' TODO: Explain further.} \item{list("search")}{List, TODO}\item{:}{List,
#' TODO} \item{list("time")}{Named numeric with the time in seconds the
#' algorithm was searching.}\item{:}{Named numeric with the time in seconds the
#' algorithm was searching.} \item{list("misc")}{List - in the moment not
#' used.}\item{:}{List - in the moment not used.} }
#' @author Kornelius Rohmeyer \email{rohmeyer@@small-projects.de}
#' @examples
#' 
#' 
#' x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)
#' print(x)
#' 
#' 
NULL





#' Selected Cross-Over designs from literature
#' 
#' Selected Cross-Over designs from literature. The available data sets are:
#' federerAtkinson3ta, federerAtkinson3tb, federerAtkinson4ta,
#' federerAtkinson4tb, federerAtkinson5ta, fletcher1, fletcher10, fletcher11,
#' fletcher12, fletcher13, fletcher14, fletcher15, fletcher16, fletcher17,
#' fletcher18, fletcher19, fletcher2, fletcher20, fletcher21, fletcher22,
#' fletcher23, fletcher24, fletcher25, fletcher26, fletcher27, fletcher28,
#' fletcher29, fletcher3, fletcher30, fletcher31, fletcher4, fletcher5,
#' fletcher6, fletcher7, fletcher8, fletcher9, iqbalJones1, iqbalJones10,
#' iqbalJones11, iqbalJones12, iqbalJones13, iqbalJones14, iqbalJones15,
#' iqbalJones16, iqbalJones17, iqbalJones18, iqbalJones19, iqbalJones2,
#' iqbalJones20, iqbalJones21, iqbalJones22, iqbalJones23, iqbalJones24,
#' iqbalJones25, iqbalJones26, iqbalJones27, iqbalJones28, iqbalJones29,
#' iqbalJones3, iqbalJones30, iqbalJones31, iqbalJones32, iqbalJones33,
#' iqbalJones34, iqbalJones35, iqbalJones36, iqbalJones37, iqbalJones38,
#' iqbalJones39, iqbalJones4, iqbalJones40, iqbalJones41, iqbalJones42,
#' iqbalJones5, iqbalJones6, iqbalJones7, iqbalJones8, iqbalJones9,
#' lewisFletcherMatthews1, lewisFletcherMatthews10, lewisFletcherMatthews11,
#' lewisFletcherMatthews12, lewisFletcherMatthews13, lewisFletcherMatthews14,
#' lewisFletcherMatthews15, lewisFletcherMatthews16, lewisFletcherMatthews17,
#' lewisFletcherMatthews18, lewisFletcherMatthews19, lewisFletcherMatthews2,
#' lewisFletcherMatthews20, lewisFletcherMatthews3, lewisFletcherMatthews4,
#' lewisFletcherMatthews5, lewisFletcherMatthews6, lewisFletcherMatthews7,
#' lewisFletcherMatthews8, lewisFletcherMatthews9, orthogonalLatinSquare3t,
#' orthogonalLatinSquare4t, orthogonalLatinSquare5t, orthogonalLatinSquare7t,
#' pattersonLucasExtraPeriod30, pattersonLucasExtraPeriod31,
#' pattersonLucasExtraPeriod32, pattersonLucasExtraPeriod33,
#' pattersonLucasExtraPeriod34, pattersonLucasExtraPeriod35,
#' pattersonLucasExtraPeriod36, pattersonLucasExtraPeriod37,
#' pattersonLucasExtraPeriod38, pattersonLucasExtraPeriod39,
#' pattersonLucasExtraPeriod40, pattersonLucasExtraPeriod41,
#' pattersonLucasExtraPeriod42, pattersonLucasExtraPeriod43,
#' pattersonLucasExtraPeriod44, pattersonLucasExtraPeriod45,
#' pattersonLucasExtraPeriod46, pattersonLucasExtraPeriod47,
#' pattersonLucasExtraPeriod48, pattersonLucasExtraPeriod49,
#' pattersonLucasExtraPeriod86, pattersonLucasPBIBD100, pattersonLucasPBIBD101,
#' pattersonLucasPBIBD102, pattersonLucasPBIBD103, pattersonLucasPBIBD104,
#' pattersonLucasPBIBD105, pattersonLucasPBIBD106, pattersonLucasPBIBD107,
#' pattersonLucasPBIBD125, pattersonLucasPBIBD126, pattersonLucasPBIBD127,
#' pattersonLucasPBIBD128, pattersonLucasPBIBD131, pattersonLucasPBIBD132,
#' pattersonLucasPBIBD133, pattersonLucasPBIBD134, pattersonLucasPBIBD135,
#' pattersonLucasPBIBD136, pattersonLucasPBIBD137, pattersonLucasPBIBD138,
#' pattersonLucasPBIBD139, pattersonLucasPBIBD140, pattersonLucasPBIBD141,
#' pattersonLucasPBIBD153, pattersonLucasPBIBD154, pattersonLucasPBIBD155,
#' pattersonLucasPBIBD156, pattersonLucasPBIBD99, pattersonLucasPltT1,
#' pattersonLucasPltT10, pattersonLucasPltT12, pattersonLucasPltT13,
#' pattersonLucasPltT15, pattersonLucasPltT16, pattersonLucasPltT17,
#' pattersonLucasPltT18, pattersonLucasPltT19, pattersonLucasPltT20,
#' pattersonLucasPltT21, pattersonLucasPltT22, pattersonLucasPltT23,
#' pattersonLucasPltT3, pattersonLucasPltT4, pattersonLucasPltT5,
#' pattersonLucasPltT7, pattersonLucasPltT8, pattersonLucasPltT9, pidgeon1,
#' pidgeon10, pidgeon11, pidgeon12, pidgeon13, pidgeon14, pidgeon15, pidgeon16,
#' pidgeon17, pidgeon18, pidgeon19, pidgeon2, pidgeon20, pidgeon3, pidgeon4,
#' pidgeon5, pidgeon6, pidgeon7, pidgeon8, pidgeon9, prescott1, prescott2,
#' quenouille3t1, quenouille3t2, quenouille4t1, quenouille4t2, quenouille4t3,
#' russel4t, russel7t, switchback3t, switchback4t, switchback5t, switchback6t,
#' switchback7t, williams3t, williams4t, williams5t, williams6t, williams7t,
#' williams8t, williams9t.
#' 
#' 
#' @name crossoverdesigns
#' @aliases anderson andersonPreece archdeacon atkinson3t atkinson4t atkinson5t
#' balaam3t balaam4t balaam5t balaam6t bateJones5t bateJones8t berenblut3t
#' berenblut4t berenblut5t blaisdellRaghavarao6t blaisdellRaghavarao8t
#' blaisdellRaghavarao9t davisHall6ta davisHall6tb davisHall6tc davisHall7ta
#' davisHall7tb davisHall7tc davisHall8ta davisHall8tb davisHall8tc
#' davisHall9ta davisHall9tb davisHall9tc federerAtkinson3ta federerAtkinson3tb
#' federerAtkinson4ta federerAtkinson4tb federerAtkinson5ta fletcher1
#' fletcher10 fletcher11 fletcher12 fletcher13 fletcher14 fletcher15 fletcher16
#' fletcher17 fletcher18 fletcher19 fletcher2 fletcher20 fletcher21 fletcher22
#' fletcher23 fletcher24 fletcher25 fletcher26 fletcher27 fletcher28 fletcher29
#' fletcher3 fletcher30 fletcher31 fletcher4 fletcher5 fletcher6 fletcher7
#' fletcher8 fletcher9 iqbalJones1 iqbalJones10 iqbalJones11 iqbalJones12
#' iqbalJones13 iqbalJones14 iqbalJones15 iqbalJones16 iqbalJones17
#' iqbalJones18 iqbalJones19 iqbalJones2 iqbalJones20 iqbalJones21 iqbalJones22
#' iqbalJones23 iqbalJones24 iqbalJones25 iqbalJones26 iqbalJones27
#' iqbalJones28 iqbalJones29 iqbalJones3 iqbalJones30 iqbalJones31 iqbalJones32
#' iqbalJones33 iqbalJones34 iqbalJones35 iqbalJones36 iqbalJones37
#' iqbalJones38 iqbalJones39 iqbalJones4 iqbalJones40 iqbalJones41 iqbalJones42
#' iqbalJones5 iqbalJones6 iqbalJones7 iqbalJones8 iqbalJones9
#' lewisFletcherMatthews1 lewisFletcherMatthews10 lewisFletcherMatthews11
#' lewisFletcherMatthews12 lewisFletcherMatthews13 lewisFletcherMatthews14
#' lewisFletcherMatthews15 lewisFletcherMatthews16 lewisFletcherMatthews17
#' lewisFletcherMatthews18 lewisFletcherMatthews19 lewisFletcherMatthews2
#' lewisFletcherMatthews20 lewisFletcherMatthews3 lewisFletcherMatthews4
#' lewisFletcherMatthews5 lewisFletcherMatthews6 lewisFletcherMatthews7
#' lewisFletcherMatthews8 lewisFletcherMatthews9 orthogonalLatinSquare3t
#' orthogonalLatinSquare4t orthogonalLatinSquare5t orthogonalLatinSquare7t
#' pattersonLucasExtraPeriod30 pattersonLucasExtraPeriod31
#' pattersonLucasExtraPeriod32 pattersonLucasExtraPeriod33
#' pattersonLucasExtraPeriod34 pattersonLucasExtraPeriod35
#' pattersonLucasExtraPeriod36 pattersonLucasExtraPeriod37
#' pattersonLucasExtraPeriod38 pattersonLucasExtraPeriod39
#' pattersonLucasExtraPeriod40 pattersonLucasExtraPeriod41
#' pattersonLucasExtraPeriod42 pattersonLucasExtraPeriod43
#' pattersonLucasExtraPeriod44 pattersonLucasExtraPeriod45
#' pattersonLucasExtraPeriod46 pattersonLucasExtraPeriod47
#' pattersonLucasExtraPeriod48 pattersonLucasExtraPeriod49
#' pattersonLucasExtraPeriod86 pattersonLucasPBIBD100 pattersonLucasPBIBD101
#' pattersonLucasPBIBD102 pattersonLucasPBIBD103 pattersonLucasPBIBD104
#' pattersonLucasPBIBD105 pattersonLucasPBIBD106 pattersonLucasPBIBD107
#' pattersonLucasPBIBD125 pattersonLucasPBIBD126 pattersonLucasPBIBD127
#' pattersonLucasPBIBD128 pattersonLucasPBIBD131 pattersonLucasPBIBD132
#' pattersonLucasPBIBD133 pattersonLucasPBIBD134 pattersonLucasPBIBD135
#' pattersonLucasPBIBD136 pattersonLucasPBIBD137 pattersonLucasPBIBD138
#' pattersonLucasPBIBD139 pattersonLucasPBIBD140 pattersonLucasPBIBD141
#' pattersonLucasPBIBD153 pattersonLucasPBIBD154 pattersonLucasPBIBD155
#' pattersonLucasPBIBD156 pattersonLucasPBIBD99 pattersonLucasPltT1
#' pattersonLucasPltT10 pattersonLucasPltT12 pattersonLucasPltT13
#' pattersonLucasPltT15 pattersonLucasPltT16 pattersonLucasPltT17
#' pattersonLucasPltT18 pattersonLucasPltT19 pattersonLucasPltT20
#' pattersonLucasPltT21 pattersonLucasPltT22 pattersonLucasPltT23
#' pattersonLucasPltT3 pattersonLucasPltT4 pattersonLucasPltT5
#' pattersonLucasPltT7 pattersonLucasPltT8 pattersonLucasPltT9 pidgeon1
#' pidgeon10 pidgeon11 pidgeon12 pidgeon13 pidgeon14 pidgeon15 pidgeon16
#' pidgeon17 pidgeon18 pidgeon19 pidgeon2 pidgeon20 pidgeon3 pidgeon4 pidgeon5
#' pidgeon6 pidgeon7 pidgeon8 pidgeon9 prescott1 prescott2 quenouille3t1
#' quenouille3t2 quenouille4t1 quenouille4t2 quenouille4t3 russel4t russel7t
#' switchback3t switchback4t switchback5t switchback6t switchback7t williams3t
#' williams4t williams5t williams6t williams7t williams8t williams9t
#' @docType data
#' @format A integer matrix ...: \describe{ \item{cross-over design}{All
#' designs are integer matrices. ...} }
#' @references ...
#' @source Anderson, I. and Preece, D.A. (2002) Locally balanced change-over
#' designs. Utilitas Mathematica, To appear.
#' 
#' Anderson, I. (2002) Personal communication.
#' 
#' Archdeacon, D.S., Dinitz J.H., Stinson, D.R. and Tillson, T.W. (1980) Some
#' new row-complete latin squares, Journal of Combinatorial Theory, Series A,
#' 29, 395-398.
#' 
#' Atkinson, G.F. (1966) Designs for sequences of treatments with carry-over
#' effects. Biometrics, 22, 292--309.
#' 
#' Balaam, L.N. (1968) A two-period design with \eqn{t^2}{t^2} experimental
#' units. Biometrics, 24, 61--73.
#' 
#' Bate, S. and Jones, B. (2002) The construction of universally optimal
#' uniform cross-over designs. GlaxoSmithKline Biomedical Data Sciences
#' Technical Report 2002-06.
#' 
#' Berenblut, I.I. (1964) Change-over designs with complete balance for
#' residual effects. Biometrics, 23, 578--580.
#' 
#' Blaisdell, E.A. and Raghavarao, D. (1980) Partially balanced change-over
#' designs based on m-associate class PBIB designs. Journal of the Royal
#' Statistical Society, B, 42, 334--338.
#' 
#' Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika,
#' 56, 283--293.
#' 
#' Federer, W.T. and Atkinson, G.F. (1964) Tied-double-change-over designs.
#' Biometrics, 20, 168--181.
#' 
#' Fletcher, D.J. (1987) A new class of change-over designs for factorial
#' experiments. Biometrika, 74, 649--654.
#' 
#' Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with
#' equal and unequal period sizes. Journal of Statistical Planning and
#' Inference, 42, 79-88.
#' 
#' Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J.
#' and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors,
#' Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science
#' Publishers B.V. (North-Holland).
#' 
#' Cochran, W.G., Autrey, K.M. and Cannon, C.Y. (1941) A double change-over
#' design for dairy cattle feeding experiments. Journal of Dairy Science, 24,
#' 937--951
#' 
#' Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina
#' Agricultural Experiment Station. Tech. Bull. No. 147.
#' 
#' Residual effects designs for comparing treatments with a control. PhD
#' dissertation, Temple University, Phildelphia, PA, 1984.
#' 
#' Prescott, P. (1994) Construction of sequentially counterbalanced designs
#' formed from two or more Latin Squares. Proceedings of the 11th Symposium on
#' Computational Statistics held in Vienna, Austria. Editors Dutter, R. and
#' Grossmann, W., Physica-Verlag: Heidelberg, 435-440.
#' 
#' Prescott, P. (1999) Construction of sequentially counterbalanced designs
#' formed from two latin squares. Utilitas Mathematica, 55, 135--152.
#' 
#' Quenouille, M.H. (1953) The Design and Analysis of Experiments. Griffin,
#' London.
#' 
#' Russell, K.R. (1991) The construction of good change-over designs when there
#' are fewer units than treatments. Biometrika, 78, 305-313.
#' 
#' Lucas, H.L. (1956) Switch-back trials for more than two treatments. Journal
#' of Diary Science, 39, 146--154.
#' 
#' Williams, E.J. (1949) Experimental designs balanced for the estimation of
#' residual effects of treatments. Australian Journal of Science Res(A), 2,
#' 14900168.
#' @keywords datasets
#' @examples
#' 
#' data(anderson)
#' 
NULL





#' Plots information about the search algorithm and its process.
#' 
#' Plots information about the search algorithm and its process.
#' 
#' The x-axis corresponds to the consecutive simulation runs and the y-axis to
#' the design criterion \var{E} that depending on the model is either a
#' weighted average of efficiency factors or standardized pairwise variances
#' and described in detail in the vignette of this package.  Also see the
#' vignette for a few examples and a discussion what can be derived from this
#' plots.
#' @name plot
#' @aliases plot,crossoverSearchResult,missing-method plot
#' @param x Result from searchCrossOverDesign.
#' @param y Missing.
#' @param ...  Further arguments: \itemize{ \item type Type of plot. Number 1 is
#' more colorful, but number 2 perhaps a bit easier to understand.
#' \item show.jumps If \code{TRUE} vertical lines will show where the specified
#' jumps occured.  }
#' @return Returns a ggplot object of the plot.
#' @author Kornelius Rohmeyer \email{rohmeyer@@small-projects.de}
#' @keywords misc graphs
#' @examples
#' 
#' 
#' x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)
#' plot(x)
#' 
#' x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, n=c(500,10), jumps=c(10, 100))
#' plot(x, show.jumps=TRUE)
#' plot(x, type=2)
#' 
#' 
NULL



