library(rvest)
library(stringi)
library(tidyr)
library(ggplot2)

getwd()
setwd("E:\\tugas\\PKL\\Caffe\\GoFood")

scrapper_gofood <- function(puturl){
  webpage <- read_html(puturl)
  produk_html <- html_nodes(webpage,'.one-line-ellipsis')
  produk <- html_text(produk_html)
  produk
  
  price_html <- html_nodes(webpage,'.null')
  price <- html_text(price_html)
  price
  
  gofood <- data.frame(produk,price)
  gofood$price <- gsub(",","",gofood$price)
  gofood$price <- as.integer(gofood$price)
  return(gofood)
}

Serujuk_Coffe <- scrapper_gofood('https://gofood.co.id/english/solo/restaurant/serujuk-coffee-geduren-8a4e4199-9caf-4319-a3bc-d7a125ebe9ba')
Moju_Moju <- scrapper_gofood('https://gofood.co.id/english/solo/restaurant/moju-moju-kartasura-06450a53-c67a-4087-96f3-f5cbeb3d9b36')
Cafe_Baca_Canarisla <- scrapper_gofood('https://gofood.co.id/english/solo/restaurant/cafe-baca-canarisla-414606e7-a4df-4f00-adec-f549b6ae136a')
Solo_Kopi <- scrapper_gofood('https://gofood.co.id/english/jakarta/restaurant/solo-kopi-pondok-aren-31218d8f-0803-41f5-b1ac-c644bd881e7a')
Kedai_Kopi_Kulo <- scrapper_gofood('https://gofood.co.id/yogyakarta/restaurant/kedai-kopi-kulo-babarsari-db570db5-8421-464f-81fc-168d6035b4d7')

summary(Serujuk_Coffe)
summary(Moju_Moju)
summary(Cafe_Baca_Canarisla)
summary(Solo_Kopi)
summary(Kedai_Kopi_Kulo)


write.csv(Serujuk_Coffe,"Serjuk_Coffe.csv")
write.csv(Moju_Moju,"Moju_Moju.csv")
write.csv(Cafe_Baca_Canarisla,"Cafe_Baca_Canarila.csv")
write.csv(Solo_Kopi,"Solo_kopi.csv")
write.csv(Kedai_Kopi_Kulo,"Kedai_Kopi_Kulo.csv")

gplot <- ggplot(data = Moju_Moju)
gplot + geom_bar(aes(x=price),fill="#31B057") + ggtitle("Serujuk Coffe")  + ylab("Jumlah") +
  theme(legend.text = element_text(size = 8), text = element_text(family = "Segoe UI Black" ), title = element_text(size = 20))


gplot + geom_point(aes(x=price,y=produk), colour="#31B057", size=8)  + scale_size(range = c(10,20))  + ylab("Makanan dan Minuman") + xlab("Produk") + labs(colour = "Produk") + ggtitle("Serujuk Coffe")  +
  theme(legend.text = element_text(size = 8), text = element_text(family = "Segoe UI Black" ), title = element_text(size = 20))