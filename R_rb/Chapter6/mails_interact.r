inbox_data <- read.table("inbox_data_enron.csv", header=TRUE, sep=",", quote='')
sent_data <- read.table("sent_data_enron.csv", header=TRUE, sep=",", quote='')

from <- inbox_data['from']
colnames(from)[1] <- 'mail'
to <- sent_data['to']
colnames(to)[1] <- 'mail'
all <- rbind(from,to)
counted <- data.frame(table(all))
sorted <- counted[order(counted['Freq'],decreasing=TRUE),]
print(sorted[0:20,])
