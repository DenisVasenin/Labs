# Анализ почерка. Построение DF времен перехода от одной клавиши к другой
setwd("D:\\JUST-TRAVEL\\KEYLOG")

# Задаем путь к каталогу, в котором хранятся все файлы с данными пользователей,
# полученные с помощью keyCollectorGui. Один файл - один пользователь
read_from= "DATA2"

# Проверяем, что папка есть. Если нет, то создаем и предупреждаем, что ее надо заполнить картинками
if(!file.exists(read_from)) { 
  dir.create(read_from)
  print(paste("В папку ", getwd(), "/", read_from, " необходимо загрузить файлы со статистикой"))
}

# Считаем, что папка с файлами есть и не пуста. Формируем список файлов в каталоге
keydatafiles <- list.files(read_from)
head(keydatafiles)  # посмотреть список 1-х шести имен
tail(keydatafiles)  # посмотреть список последних шести имен

## поготовка каталога для обработанных файлов с временем перехода от одной клавиши к другой
save_in <- paste0(read_from,"_dT")
if(!file.exists(save_in)) dir.create(save_in)

# программа формирует таблицу времен перехода от нажатия одной калвиши до нажатия другой клавиши
formK2Kdt = function(keyclct) {
  # фильтруем только события KEY_DOWN
  keyDownDF <- keyclct[keyclct[,3]=="KEY_DOWN", 1:2]
  
  timepresd = keyDownDF[,1]
  keypresd= keyDownDF[,2]
  keys <- unique(keypresd)
  print(paste("Всего зафиксировано нажатий клавиш = ", nrow(keyDownDF)))
  print(paste("Всего зафиксировано нажатий различных клавиш = ", length(keys)))
  
  # Формирование матрицы времен перехода от key1 к key2
  nkeypresd = nrow(keyDownDF) 
  dftime <- data.frame(key1=keypresd[1:(nkeypresd-1)],
                       key2=keypresd[2:nkeypresd],
                       dtime= timepresd[2:nkeypresd] - timepresd[1:(nkeypresd-1)])
  # Фильтрация матрицы времен перехода от key1 к key2
  u1 <- ! is.na(dftime$key1)
  u2 <- ! is.na(dftime$key2)
  dftime1 <- dftime[u1&u2,] 
  print(paste("Отфильтровано ", sum(!(u1&u2)), " строк"))
  dftime1
}

# Main loop preparing of keydatafiles 
for(i in 1:length(keydatafiles))
{
  # Try-catch нужен для учета того, что некоторых файлов может не быть из списка или нечитабельны
  result <- tryCatch({
    # Image name
    keyname <- keydatafiles[i]
    # Read image
    keyclct <- read.csv(paste0(getwd(), "/", read_from, "/", keyname), header = FALSE, sep="")
    # Resize image 28x28
    key2keydt <-  formK2Kdt(keyclct)
    head(key2keydt)
    #table(key2keydt[,1])
    #hist(key2keydt[,3])

    path <- paste0(getwd(), "/", save_in, "/", keyname, sep = "")
    # Save df
    write.csv(key2keydt, file =  path, row.names = FALSE)

    # Print status
    print(paste("Done",i,sep = " "))},
    # Error function
    error = function(e){print(e)}
  )
}
#  ВСЕ файлы с временами перехода созданы И МОГУТ ИСПОЛЬЗОВАТЬСЯ ДЛЯ СОЗДАНИЯ Общей МАТРИЦЫ

## ОБъединение данных из разных таблиц в одну большую таблицу с разными метками
# Считаем, что папка с файлами есть и не пуста. Формируем список файлов в каталоге
k2kdatafiles <- list.files(save_in)
head(k2kdatafiles)  # посмотреть список 1-х шести имен
tail(k2kdatafiles)  # посмотреть список последних шести имен

i=1
keyname <- k2kdatafiles[i]
# Read 1 file
k2kdata <- read.csv(paste0(getwd(), "/", save_in, "/", keyname), header = TRUE, sep=",")
# создаем общую таблицу
alldata <- k2kdata
alldata$userId <- i
head(alldata)
str(alldata)
# создаем таблицу с расшифровкой ключей
keyID_name <- data.frame(userID=1:length(k2kdatafiles), userName= k2kdatafiles)
str(keyID_name)
  
for(i in 2:length(k2kdatafiles))
{
  # Try-catch нужен для учета того, что некоторых файлов может не быть из списка или нечитабельны
  result <- tryCatch({
    # Image name
    keyname <- k2kdatafiles[i]
    # Read 1 file
    k2kdata <- read.csv(paste0(getwd(), "/", save_in, "/", keyname), header = TRUE, sep=",")
    k2kdata$userId <- i
    keyID_name[i,"userName"] <- keyname
    
    # ДОбавляем данные в одну таблицу данных
    alldata <-  rbind(alldata, k2kdata)
    
    # Print status
    print(paste("Done",i,sep = " "))},
    # Error function
    error = function(e){print(e)}
  )
}

dim(alldata)
str(alldata)
unique(alldata[,"userId"])

# Save datasets
write.csv(alldata, "k2k_alldata.csv", row.names = FALSE)

# Теперь у нас есть общий набор с метками
write.csv(keyID_name, "userID_Name.csv", row.names = FALSE)

