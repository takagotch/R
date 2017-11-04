data <- read.csv(file='heartbeat.csv', header=TRUE)
filtered_data <- data[data$ch1 > 95 & data$ch1 < 105,]
cycle <- as.numeric(rownames(filtered_data))

beats <- unique(round(cycle/1000))
intervals <- c()
count <- 1
while (count < length(beats)) {
  intervals <- append(intervals, beats[count+1] - beats[count])
  count <- count + 1
}

intervals <- intervals[!intervals<5]

steps = seq(from=1, to=length(intervals), by=2)
frequency <- c()
count <- 1
for (step in steps) {
  frequency <- append(frequency, intervals[step] + intervals[step+1])
  count <- count + 1
}

average_frequency <- mean(frequency, na.rm=T)
heart_rate <- round(60/(average_frequency/44.1))

print(paste("Interval between successive S1 + S2 sounds is", 
    round(average_frequency*1000), "cycles"))
print(paste("Heart rate is ", heart_rate, "bpm"))
