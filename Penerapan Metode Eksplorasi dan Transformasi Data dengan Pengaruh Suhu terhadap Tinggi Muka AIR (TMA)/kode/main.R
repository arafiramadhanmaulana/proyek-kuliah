library(readr)
TMA_Jambi1_2019 <- read_csv("C:/Users/arafi/Downloads/TMA_Jambi1_2019.txt")
View(TMA_Jambi1_2019)


str(TMA_Jambi1_2019)

head(TMA_Jambi1_2019)
tail(TMA_Jambi1_2019)

summary(TMA_Jambi1_2019)

standar_deviasi_suhu <- sd(TMA_Jambi1_2019$`Suhu (celcius)`)
standar_deviasi_GWL <- sd(TMA_Jambi1_2019$`GWL (m)`)

plot(TMA_Jambi1_2019$`Suhu (celcius)`, TMA_Jambi1_2019$`GWL (m)`, col = "blue", main = "Scatter Plot Suhu vs GWL", xlab = "Suhu", ylab = "GWL")

hist(TMA_Jambi1_2019$`Suhu (celcius)`, col = "skyblue", main = "Histogram Suhu", xlab = "Suhu", ylab = "Frequency")
hist(TMA_Jambi1_2019$`GWL (m)`, col = "purple", main = "Histogram GWL", xlab = "GWL", ylab = "Frequency")

boxplot(TMA_Jambi1_2019$`Suhu (celcius)`, col = "yellow", main = "Boxplot Suhu", xlab = "Suhu", ylab = "Frequency")
boxplot(TMA_Jambi1_2019$`GWL (m)`, col = "green", main = "Boxplot GWL", xlab = "GWL", ylab = "Frequency")
boxplot(TMA_Jambi1_2019$`Suhu (celcius)`, TMA_Jambi1_2019$`GWL (m)`, names = c("Suhu", "GWL"), col = c("blue", "red"), main = "Boxplot Suhu dan GWL", ylab = "Frequency")

barplot(table(TMA_Jambi1_2019$`Suhu (celcius)`), col = "orange", main = "Bar Chart Berdasarkan Suhu", xlab = "Suhu", ylab = "Frequency")
barplot(table(TMA_Jambi1_2019$`GWL (m)`), col = "Brown", main = "Bar Chart Berdasarkan GWL", xlab = "GWL", ylab = "Frequency")

pie(table(TMA_Jambi1_2019$`Suhu (celcius)`), col = c("red", "blue"), main = "Pie Chart Berdasarkan Suhu")
pie(table(TMA_Jambi1_2019$`GWL (m)`), col = c("yellow", "black"), main = "Pie Chart Berdasarkan GWL")


data_suhu_tinggi <- TMA_Jambi1_2019[TMA_Jambi1_2019$`Suhu (celcius)` > 25, ]

rata_rata_suhu <- mean(TMA_Jambi1_2019$`Suhu (celcius)`)

normalized_suhu <- scale(TMA_Jambi1_2019$`Suhu (celcius)`)
normalized_GWL <- scale(TMA_Jambi1_2019$`GWL (m)`)

options(max.print = 2000000)

TMA_Jambi1_2019 <- data.frame(
  ID = 1:11485,
  Value = c(1:5000, rep(NA, 5000), 5001:11485)
)
TMA_Jambi1_2019_cleaned <- na.omit(TMA_Jambi1_2019)
cat("Jumlah baris setelah menghapus nilai kosong:", nrow(TMA_Jambi1_2019_cleaned), "\n")
complete.cases(TMA_Jambi1_2019)

library(dplyr)

TMA_Jambi1_2019 <- TMA_Jambi1_2019 %>%
  mutate(Suhu_Fahrenheit = (`Suhu (celcius)` * 9/5) + 32)

TMA_Jambi1_2019$Suhu_Fahrenheit <- cut(TMA_Jambi1_2019$`Suhu (celcius)`, breaks = c(-Inf, 20, 25, Inf), labels = c("Rendah", "Sedang", "Tinggi"))
colnames(TMA_Jambi1_2019)[colnames(TMA_Jambi1_2019) == "Tinggi_Suhu"] <- "Tinggi_Suhu"

missing_values <- is.na(TMA_Jambi1_2019)

sum_missing_per_column <- colSums(missing_values)

