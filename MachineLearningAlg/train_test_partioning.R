# ------------------------------------------------------------------
# This material is distributed under the GNU General Public License
# Version 2. You may review the terms of this license at
# http://www.gnu.org/licenses/gpl-2.0.html
#
# Copyright (c) 2012-2016, Michel Lang, Helena Kotthaus,
# TU Dortmund University
#
# All rights reserved.
#
# Partition a matrix/data.frame into test and training subsets
# Widely used in machine learning applications because an independent
# test set is required to validate algorithms without being over optimistic
# ------------------------------------------------------------------


# change these numbers to get suitable runtime
n <- 200    # number of observations
p <- 10000  # number of covariates
N <- 100    # number of repetitions

X <- matrix(rnorm(n * p), n, p)
colnames(X) <- sprintf("var_%04i", 1:p)
rownames(X) <- sprintf("obs_%04i", 1:n)

####################################################################################
### benchmark code below
####################################################################################

# numeric
for (i in 1:N) {
  ind <- sample(nrow(X), 2 / 3 * nrow(X))
  train <- X[ind, ]
  test <- X[setdiff(1:N, ind), ]
}

# logical
for (i in 1:N) {
  ind <- sample(nrow(X)) < 2 / 3 * nrow(X)
  train <- X[ind, ]
  test <- X[!ind, ]
}

# character
for (i in 1:N) {
  ind <- sample(rownames(X), 2 / 3 * nrow(X))
  train <- X[ind, ]
  test <- X[setdiff(rownames(X), ind), ]
}
