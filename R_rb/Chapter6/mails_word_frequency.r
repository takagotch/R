library(tm)

sent_data <- read.csv("sent_txt_data_enron.csv", header=TRUE, sep=",")

alldates <- format(as.Date(sent_data$date), '%Y-%m')
for (date in levels(factor(alldates))) {
  data <- sent_data[format(as.Date(sent_data$date), "%Y-%m") == date, ]
  source <- VectorSource(data$body)
  corpus <- Corpus(source)
  matrix <- TermDocumentMatrix(corpus, control = list(stopwords = TRUE, removeNumbers = TRUE, removePunctuation = TRUE))
  frequent_terms <- findFreqTerms(matrix, 100)
  print(date)
  print(nrow(data))
  print(frequent_terms)
}

inbox_data <- read.csv("inbox_txt_data_enron.csv", header=TRUE, sep=",")

alldates <- format(as.Date(inbox_data$date), '%Y-%m')
for (date in levels(factor(alldates))) {
  data <- inbox_data[format(as.Date(inbox_data$date), "%Y-%m") == date, ]

  source <- VectorSource(data$body)
  corpus <- Corpus(source)
  matrix <- TermDocumentMatrix(corpus, control = list(stopwords = TRUE, removeNumbers = TRUE, removePunctuation = TRUE))
  frequent_terms <- findFreqTerms(matrix, 300)
  print(date)
  print(nrow(data))
  print(frequent_terms)  
}

