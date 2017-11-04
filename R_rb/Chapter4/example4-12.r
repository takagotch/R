sim1_data <- read.table("simulation1.csv", header=TRUE, sep=",")
sim1_data_x70 <- sim1_data$X70

sim3_1_data <- read.table("simulation3-1.csv", header=TRUE, sep=",")
sim3_1_data_x70 <- sim3_1_data$X70

wilcox.test(sim1_data_x70, sim3_1_data_x70)