# Анализ почерка. Построение DF времен перехода от одной клавиши к другой
library('reshape2')
library('ggplot2')
library('plyr')

# ------------------ Грузим исходные данные ------------------
# определяем рабочий каталог, в котором хранится исходный файл с общим набором данных

#  Загружаем общий набор с метками
alldata1 <- read.csv("k2k_alldata.csv", header = TRUE)
# Загружаем таблицу расшифровки меток
keyID_name <- read.csv("userID_Name.csv", header = TRUE)
usersQ <- nrow(str(keyID_name))

# ------------ агрегируем и проводим первичное исследование ------------

# Получаем агрегированные данные - кол-во переходов для каждой клавиши
kqdata <- acast(alldata1, key1 ~ key2)
str(kqdata)

# Получаем агрегированные данные - среднее время перехода от клавиши
kmdata <- acast(alldata1, key1 ~ key2, value.var = "dtime", mean, fill = 0)
dim(kmdata)

# фильтруем данные
alldata2 <- alldata1[alldata1$dtime < 2000, ]
str(alldata2)
print(paste("в качестве выбросов отфильтрован ", round(100*(1-nrow(alldata2)/nrow(alldata1)),2), "% переходов"))
tittle = paste("Распределение времени перехода между клавишами для ", usersQ, "пользователей")
qplot(data= alldata2, dtime, main = tittle, color=as.factor(alldata2$userId), binwidth=100)

# ------------ Анализируем данные по каждому пользователю отдельно -------------
dtTabList <- list(1:usersQ)
minTab <- kqdata
minTabfun <- Vectorize(function(xTab, yTab) min(xTab, yTab), c("xTab", "yTab"))
for(iu in 1:usersQ) {
  # Получаем данные - кол-во переходов для каждой пары клавиш для фиксированного пользователя
  data1 <- alldata1[alldata1$userId == iu,]
  str(data1)
  kqdata1 <- acast(data1, key1 ~ key2)
  str(kqdata1)
  kqdata2 <- kqdata*0
  kqdata2[rownames(kqdata1), colnames(kqdata1)] <- kqdata1
  minTab <- matrix(data= minTabfun(minTab,kqdata2), nrow=nrow(kqdata))
  sum(minTab)
  # Получаем данные - среднее время перехода для каждой пары клавиш для фиксированного пользователя
  kmdata1 <- acast(data1, key1 ~ key2, value.var = "dtime", mean, fill = 0)
  dtTabList[[iu]] <- kmdata1
}
Qvect <- as.vector(minTab)
table(Qvect)

# Будем исследовать только те переходы, которые встречаются у каждого пользователя более раза
u1 <- Qvect > 1
# таких переходов всего 
sum(u1)
# вытащим коды клавиш для таких переходов
u1nums <- (1:length(Qvect))[u1]
k2kQ <- length(u1nums)
u1rows <- (u1nums-1) %% nrow(kqdata) +1
u1cols <- (u1nums-1) %/% nrow(kqdata) +1 
key1 <- rownames(kqdata)[u1rows]
key2 <- rownames(kqdata)[u1cols]
length(key1)
# проверка:
for(nn in 1:k2kQ) {
  qq <- minTab[u1rows[nn], u1cols[nn]]
  # key1[nn] <- rownames(kqdata)[u1rows[nn]]
  # key2[nn] <- rownames(kqdata)[u1cols[nn]]
  print(paste("Переход от клавиши", key1, "к клавише", key2, "зафиксирован минимум", qq, "раз"))
} 

# Для каждого пользователя теперь вытаскиваем средние времена перехода от клавиш key1 к key2
dtk2kfun = function(k2kTab) {
  dt<- 1:k2kQ *1.0
  for(nn in 1:k2kQ) dt[nn]= k2kTab[key1[nn], key2[nn]]
  dt
}

dtmean <- sapply(dtTabList, dtk2kfun)
str(dtmean)
dtmeanDF <- data.frame(dtmean, row.names = paste0(key1,"_",key2))
colnames(dtmeanDF) <- paste0("usr",1:usersQ)
dim(dtmeanDF)
qplot(data = dtmeanDF, x=usr1, y=usr4)

# -------------- Создаем общую матрицу данных для построения классификатора ------------

# Для каждого пользователя формируем таблицу с его данными перехода между отобранными клавишами
# Используем отфильтрованный набор с метками alldata2
str(alldata2)

userK2KDt_DF0 <- as.data.frame(t(dtmean) )
userK2KDt_DF0$userId <- 1:usersQ
head(userK2KDt_DF0, n=2)

# Задаем кол-во генерируемых наблюдений NN - объем выборки для каждого пользователя и готовим таблицы
NN = 1000
# таблица для всех измерений
ALLuserK2KDt_DF <- userK2KDt_DF0[userK2KDt_DF0$V1 == 0, ]
colnames(ALLuserK2KDt_DF) <- c(paste0(key1,"_",key2), "usrID")
# таблица для одного пользователя
userK2KDt_DF <- data.frame(matrix(0, nrow = NN, ncol = k2kQ))
colnames(userK2KDt_DF) <- paste0(key1,"_",key2)
userK2KDt_DF$usrID <- 0
dim(userK2KDt_DF)
dim(ALLuserK2KDt_DF)

i_user = 1
for(i_user in 1:usersQ) {
  k2kdt_1 = list()
  # allcombQ <- 1
  # Определяем список времен переходов для каждой пары клавиш
  for(nn in 1:k2kQ) {
    u <- (alldata2$key1 == key1[nn]) & (alldata2$key2 == key2[nn]) & (alldata2$userId == i_user)
    # allcombQ <- allcombQ*sum(u)
    # print(sum(u))
    k2kdt_1[[nn]] <- alldata2$dtime[u]
  }
  #k2kdt_1[[1]]
  # Делаем случайный выбор времени перехода для каждой пары клавиш и создаем df c nrow=NN - кол-во измерений
  for(nn in 1:k2kQ) {
    rand_dts <- sample(k2kdt_1[[nn]], size = NN, replace = TRUE)
    userK2KDt_DF[,nn] <- rand_dts
  }
  userK2KDt_DF$usrID <- i_user
  ALLuserK2KDt_DF <- rbind(ALLuserK2KDt_DF, userK2KDt_DF)
}
dim(ALLuserK2KDt_DF) 
# Записываем это все в файл

write.csv(ALLuserK2KDt_DF, "ALLuserK2KDt_DF.csv", row.names = FALSE)
