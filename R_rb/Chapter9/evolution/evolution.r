library(grid)
library(ggplot2)

data <- read.table("evolution.csv", header=F, sep=",")
colnames(data) <- c('population','metabolism','vision_range')
pdf("evolution.pdf")
time = 1:nrow(data)

grid.newpage()
pushViewport(viewport(layout=grid.layout(1,2)))
vplayout <- function(x,y) {viewport(layout.pos.row=x, layout.pos.col=y)}

p <- qplot(time, metabolism, data=data, geom=c("point", "smooth"), main="Evolution in metabolism")
print(p, vp=vplayout(1,1))
p <- qplot(time, vision_range, data=data, geom=c("point", "smooth"), main="Evolution in vision range")
print(p, vp=vplayout(1,2))

dev.off()