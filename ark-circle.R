squares <- seq(0, 10, by=0.5)
triangles <- c(0:10)
diagonal <- c(0:7)
l <- list(squares, triangles, diagonal)
do.call(expand.grid, l)
combinations <- do.call(expand.grid, l)
radius <- combinations$Var1 + 0.86603 * combinations$Var2 + 1.41421 * combinations$Var3
combinations$radius <- radius
combinations$base <- combinations$radius * 0.26330
combinations$fit <- combinations$base - as.integer(combinations$base)
colnames(combinations) <- c("Squares", "Triangles", "Diagonal", "radius", "base", "fit")
filtered <- combinations %>% filter(radius <10)
filtered <- filtered %>% filter(radius >3)
filtered <- filtered %>% filter(fit <0.1 | fit >0.9)
sorted <- filtered[
  with(filtered, order(radius, fit)),
  ]
#Filtering example multilayered circle
options <- combinations %>% filter(fit >0.9) %>% filter(base >1.9) %>% filter(base <2.1) %>% filter(Squares >2)  %>% filter(Triangles ==3| Triangles ==5)
