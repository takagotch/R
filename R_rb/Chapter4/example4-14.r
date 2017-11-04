library(ggplot2)

pdf("figure4-10.pdf")

data <- read.table("simulation3-4.csv", header=TRUE, sep=",")
df <- data.frame(table(data$X300))
colnames(df) <- c("queue_size", "frequency")

ggplot(data=df) + opts(legend.position = "none") + 
  geom_bar(aes(x = queue_size, y = frequency, fill = factor(queue_size))) +
  geom_text(aes(x = queue_size, y = frequency, label = df$frequency, size=1)) +
  scale_y_continuous("frequency") +
  scale_x_discrete("queue size")

print(df)

pdf("figure4-11.pdf")

data <- read.table("simulation3.csv", header=TRUE, sep=",")
df <- data.frame(table(data$X300))
colnames(df) <- c("queue_size", "frequency")

ggplot(data=df) + opts(legend.position = "none") +
  geom_bar(aes(x = queue_size, y = frequency, fill = factor(queue_size))) +
  geom_text(aes(x = queue_size, y = frequency, label = df$frequency, size=1)) +
  scale_y_continuous("frequency") +
  scale_x_discrete("queue size") +
  theme(axis.text.x = theme_text(angle = 90, size = 7))

print(df)

