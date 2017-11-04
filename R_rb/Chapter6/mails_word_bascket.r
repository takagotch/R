library(tm)
library(arules)

in_data <- read.csv("inbox_txt_data_enron.csv", header=TRUE, sep=",")

terms_list <- as.list(NULL)
for (i in 1:length(in_data$body)){
  source <- VectorSource(in_data$body[i])
  corpus <- Corpus(source)
  matrix <- TermDocumentMatrix(corpus, control = list(stopwords = TRUE, removeNumbers = TRUE, removePunctuation = TRUE))
  terms_list <-  c(terms_list, list(matrix$dimnames$Terms))
}

tran <- as(terms_list, "transactions")
in_ap <- apriori(tran, parameter = list(support=0.03,confidence=0.05, maxlen=3))

inspect(head(sort(subset(in_ap, subset = lhs %pin% "bankruptcy"), by = "support"),n=20))
inspect(head(sort(subset(in_ap, subset = lhs %pin% "pge"), by = "support"),n=20))
inspect(head(sort(subset(in_ap, subset = lhs %pin% "crisis"), by = "support"),n=20))
inspect(head(sort(subset(in_ap, subset = lhs %pin% "edison"), by = "support"),n=20))