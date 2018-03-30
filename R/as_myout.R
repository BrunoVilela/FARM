# Transform a D-place list object into my out
# D_place[[1]] is the data frame with societies information (25 columns)
# D_place[[2]] the tree, tip labels match the sequence of D_place[[1]]

as_myout <- function(D_place) {
  myWorld <- BuildWorld(D_place[[1]][, 9:10], rep(0, nrow(D_place[[1]])))
  farm <- ((D_place[[1]]$animal_husbandry + D_place[[1]]$agriculture) > 0) + 1
  myWorld[, 6] <- farm
  mytree <- D_place[[2]]
  mytree$tip.label <- myWorld[, 8]
  myout <- list('mytree' = mytree, 'myWorld' = myWorld)
  return(myout)
}
