con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6
4 5 6 1 2 3  6 1 2 3 4 5
5 6 1 2 3 4  2 3 4 5 6 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 3, n = 12, t = 6"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN SIX TREATMENTS A"
davisHall6ta <- t

con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  4 5 6 1 2 3
4 5 6 1 2 3  2 3 4 5 6 1
3 4 5 6 1 2  5 6 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 4, n = 12, t = 6"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN SIX TREATMENTS B"
davisHall6tb <- t

con <- textConnection("
1 2 3 4 5 6
2 3 4 5 6 1
4 5 6 1 2 3
3 4 5 6 1 2
6 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 5, n = 6, t = 6"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN SIX TREATMENTS C"
davisHall6tc <- t

#####

con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7
4 5 6 7 1 2 3  5 6 7 1 2 3 4
2 3 4 5 6 7 1  6 7 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 3, n = 14, t = 7"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN SEVEN TREATMENTS A"
davisHall7ta <- t

con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  7 1 2 3 4 5 6
4 5 6 7 1 2 3  5 6 7 1 2 3 4
7 1 2 3 4 5 6  2 3 4 5 6 7 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 4, n = 14, t = 7"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN SEVEN TREATMENTS B"
davisHall7tb <- t

con <- textConnection("
1 2 3 4 5 6 7
3 4 5 6 7 1 2
4 5 6 7 1 2 3
2 3 4 5 6 7 1
6 7 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 5, n = 7, t = 7"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN SEVEN TREATMENTS C"
davisHall7tc <- t

#####

con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
5 6 7 8 1 2 3 4  7 8 1 2 3 4 5 6
2 3 4 5 6 7 8 1  6 7 8 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 3, n = 16, t = 8"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN EIGHT TREATMENTS A"
davisHall8ta <- t


con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
3 4 5 6 7 8 1 2  2 3 4 5 6 7 8 1
2 3 4 5 6 7 8 1  6 7 8 1 2 3 4 5 
5 6 7 8 1 2 3 4  4 5 6 7 8 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 4, n = 16, t = 8"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN EIGHT TREATMENTS B"
davisHall8tb <- t


con <- textConnection("
1 2 3 4 5 6 7 8
2 3 4 5 6 7 8 1
4 5 6 7 8 1 2 3
3 4 5 6 7 8 1 2
6 7 8 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 5, n = 8, t = 8"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN EIGHT TREATMENTS C"
davisHall8tc <- t

####

con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
4 5 6 7 8 9 1 2 3  7 8 9 1 2 3 4 5 6
9 1 2 3 4 5 6 7 8  8 9 1 2 3 4 5 6 7")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 3, n = 18, t = 9"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN NINE TREATMENTS A"
davisHall9ta <- t



con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
2 3 4 5 6 7 8 9 1  6 7 8 9 1 2 3 4 5
5 6 7 8 9 1 2 3 4  3 4 5 6 7 8 9 1 2
3 4 5 6 7 8 9 1 2  7 8 9 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 4, n = 18, t = 9"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN NINE TREATMENTS B"
davisHall9tb <- t



con <- textConnection("
1 2 3 4 5 6 7 8 9
2 3 4 5 6 7 8 9 1
4 5 6 7 8 9 1 2 3
3 4 5 6 7 8 9 1 2
6 7 8 9 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Davis, A.W. and Hall, W.B. (1969) Cyclic change-over designs. Biometrika, 56, 283--293."
attr(t, "signature") <- "p = 5, n = 9, t = 9"
attr(t, "title") <- "DAVIS AND HALL CYCLIC DESIGN NINE TREATMENTS C"
davisHall9tc <- t





save(davisHall6ta, davisHall6tb, davisHall6tc, davisHall7ta, davisHall7tb, davisHall7tc, davisHall8ta, davisHall8tb, davisHall8tc, davisHall9ta, davisHall9tb, davisHall9tc, file="davisHall.rda")

