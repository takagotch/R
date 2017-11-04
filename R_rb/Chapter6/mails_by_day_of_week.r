library(ggplot2)
library(mailminer)

inbox_data <- read.table("inbox_data_enron.csv", header=TRUE, sep=",", quote="")
sent_data <- read.table("sent_data_enron.csv", header=TRUE, sep=",", quote="")

inbox_count <- dates_count(dates=inbox_data['date'], element='%w')
sent_count <- dates_count(dates=sent_data['date'], element='%w')

days_of_week <- c("Sun", "Mon","Tue","Wed","Thu","Fri","Sat")

df <- data.frame(days=factor(days_of_week, levels=days_of_week),inbox=inbox_count,sent=sent_count)

ggplot(data=df) + scale_shape_manual(name="Mailbox", values=c(2,3)) +
  geom_point(aes(x=days,y=inbox, shape='inbox')) +
  geom_smooth(aes(x=days,y=inbox, group=1)) +
  geom_point(aes(x=days,y=sent, shape='sent')) +
  geom_smooth(aes(x=days,y=sent, group=2)) +
  scale_y_continuous('number of emails') +
  scale_x_discrete('day of week')