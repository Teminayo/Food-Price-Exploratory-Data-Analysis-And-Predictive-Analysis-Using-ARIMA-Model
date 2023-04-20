#Import Data
library(readr)
food_prices_large2 <- read_csv("food_prices/food_prices_large2.csv")
View(food_prices_large2)

#load library
library(tidyverse)
library(dplyr)
library(formattable)
library(lessR)
library(psych)
library(plyr)
library(ggplot2)



##Filter for onllu Country
unique(food_prices_large2$Country)
attach(food_prices_large2)
colnames(food_prices_large2)

#count  total missing values in each column
sapply(food_prices_large2, function(x) sum(is.na(x)))

#view First six rows of food price
head(food_prices_large2)

#display rows and columns
dim(food_prices_large2)

#Measure of central Tendency
mean(food_prices_large2$Price)

#measure of count
table(food_prices_large2$Product, food_prices_large2$Price)
table(Product)
table(Country)

#measureofnormality
hist(Year, xlab = "price over the year",
     ylab = "frequency",
     main =  "Histogram for food price",
     col = "green",
     probability = TRUE)

lines(density(Price))    


boxplot(Price, 
        xlab = "price",
        ylab = "freq",
        main = "boxplot for product",
        col = "blue")

#Create Histogram of values for Price
ggplot(data = food_prices_large2,aes(x=Price)) +geom_histogram(fill = "steel blue", 
                                                               color = "black") +
  ggtitle("frequency Of Price")

#Define data
priceoffood <- c(Price)
productsold <- c(Product)
Country <- c(Country)
view(priceoffood)
view(productsold)
view (Country)
#combine data into data frame
food_prices_large2 <-data_frame(priceoffood,productsold,Country)
view(food_prices_large2)
#Create a bar chart
ggplot(food_prices_large2,aes(x = productsold,y = priceoffood))+geom_bar(stat = "Identity" , fill = "Green")+
  labs(title = "Price of product sold", x ="product sold",y = "price of food")

#sort product
sort_product <-food_prices_large2 %>% arrange(desc(productsold))



#Sort data by numbers in decending order and select top 10
Buttom10 <- sort_product %>% tail(10)
Top10 <- sort_product%>% head(10)

print(Top10) 
print
library(tinytex)
library(markdown)
library(knitr)
library(rmarkdown)
