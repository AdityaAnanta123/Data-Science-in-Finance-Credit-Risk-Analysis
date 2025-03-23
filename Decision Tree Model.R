#import library  
library("openxlsx")
library("C50")
library("reshape2")
  
#Preparation Data
dataCreditRating <- read.xlsx(xlsxFile = "https://storage.googleapis.com/dqlab-dataset/credit_scoring_dqlab.xlsx")

#Show structure dataCreditRating
str(dataCreditRating)
  
#Convert column risk_rating to factor
dataCreditRating$risk_rating <- as.factor(dataCreditRating$risk_rating)
  
#Show structure after convertion
str(dataCreditRating)

#Select multiple column (durasi_pinjaman_bulan and jumlah_tanggungan)  
input_columns <- c("durasi_pinjaman_bulan","jumlah_tanggungan")

#Make a new variable named datafeed inserted variable input_columns
datafeed <- dataCreditRating[ , input_columns]

#Show structured datafeed
str(datafeed)
  
#Prepare a portion of random indexes for training and testing sets
set.seed(100)
indeks_training_set <- sample(900, 800)
  
#Make training set and testing set
input_training_set <- datafeed[indeks_training_set,]
class_training_set <- dataCreditRating[indeks_training_set,]$risk_rating
input_testing_set <- datafeed[-indeks_training_set,]
  
#Show structure input_training_set, class_training_set, and input_testing_set
str(input_training_set)
str(class_training_set)
str(input_testing_set)
  
#Make a model risk_rating
risk_rating_model <- C5.0(input_training_set, class_training_set, control = C5.0Control(label = "Risk Rating"))

#Show summary risk_rating_model
summary(risk_rating_model)

#Show plot model of risk_rating_model
plot(risk_rating_model)
  
#Using model to predict testing set
predict(risk_rating_model, input_testing_set)
  
#Insert factual data risk_rating in input_testing_set to risk_rating in dataCreditRating  
input_testing_set$risk_rating <- dataCreditRating[-indeks_training_set,]$risk_rating
  
#Save the test set prediction results into the hasil_prediksi column
input_testing_set$hasil_prediksi<- predict(risk_rating_model, input_testing_set)

#Show value of input_testing_data
print(input_testing_set)
  
#Make confusion matrix
dcast(hasil_prediksi ~ risk_rating, data =input_testing_set)
  
#Show the same value between the risk_rating and the predicted result
input_testing_set$risk_rating == input_testing_set$hasil_prediksi

#Show the same values between the risk_rating and the predicted result into a dataframe
input_testing_set[input_testing_set$risk_rating == input_testing_set$hasil_prediksi,]
  
#Calculate the correct number of predictions
nrow(input_testing_set[input_testing_set$risk_rating == input_testing_set$hasil_prediksi,])

#Calculate the wrong number of predictions
nrow(input_testing_set[input_testing_set$risk_rating != input_testing_set$hasil_prediksi,]) 

#Make a new dataframe named aplikasi_baru with column jumlah_tanggungan and durasi_peminjaman_bulan
aplikasi_baru <- data.frame(jumlah_tanggungan = 6, durasi_pinjaman_bulan = 12)
  
#Make predictions on new dataframe aplikasi_baru
predict(risk_rating_model, aplikasi_baru)  