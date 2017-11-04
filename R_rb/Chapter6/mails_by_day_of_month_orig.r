library(ggplot2)

inbox_data <- read.table("inbox_data_enron.csv", header=TRUE, sep=",", quote='')
sent_data <- read.table("sent_data_enron.csv", header=TRUE, sep=",", quote='')

dates <- as.Date(as.vector(as.matrix(inbox_data['date'])),"%Y-%m-%dT%H:%M:%S")
elements <- format(dates, '%d')
inbox_count <- data.frame(table(elements))$Freq

dates <- as.Date(as.vector(as.matrix(sent_data['date'])),"%Y-%m-%dT%H:%M:%S")
elements <- format(dates, '%d')
sent_count <- data.frame(table(elements))$Freq

df <- data.frame(days=1:31,inbox=inbox_count,sent=sent_count)

ggplot(data=df) + scale_shape_manual(name="Mailbox", value=c(2,3)) +
  geom_point(aes(x=days,y=inbox, shape='inbox')) +
  geom_smooth(aes(x=days,y=inbox, group=1)) +
  geom_point(aes(x=days,y=sent, shape='sent')) +
  geom_smooth(aes(x=days,y=sent, group=2)) +
  scale_y_continuous('number of emails') +
  scale_x_discrete('day of month')
