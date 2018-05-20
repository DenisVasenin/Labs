#! /usr/bin/python3


# CAVE CLASS ===================================================================

class Cave:

  # ссылка на обьект мира
  __world         = None

  # параметры пещеры
  __id            = 0     # id пещеры
  __row           = 0     # строка пещеры
  __col           = 0     # столбец пещеры
  __isGold        = 0     # есть ли золото?
  __isHole        = 0     # есть ли яма?
  __isWind        = 0     # есть ли ветер?
  __isBones       = 0     # есть ли кости?
  __cost          = 0     # цена пещеры
  __nearCavesDict = {}    # словарь соседних пещер {'direct': caveId}

  # переменные для подсчета цены пещеры
  __windCost      = 0     # стоимость ветра
  __boneCost      = 0     # стоимость костей
  __holeCost      = 50    # стоимость провала


  def __init__(self, world, row, col, isGold, isHole, isWind, isBones, allowDirects):
    self.__world         = world
    self.__id            = self.getIdFromPos(row, col)
    self.__row           = row
    self.__col           = col
    self.__isGold        = isGold
    self.__isHole        = isHole
    self.__isWind        = isWind
    self.__isBones       = isBones
    self.__nearCavesDict = self.getNearCavesDict(row, col, allowDirects)
    return

# PUBLIC =======================================================================
  
  # получить id пещеры
  def getId(self):
    return self.__id

  # получить цену пещеры
  def getCost(self):
    return self.__cost

  def isGold(self):
    return self.__isGold

  def isHole(self):
    return self.__isHole

  # получить словарь соседних пещер
  def getNearCaves(self):
    return self.__nearCavesDict

  # обновить цену пещеры от состояния игрока и мира
  def updateCost(self, monstersCount, arrowsCount, legsCount):
    self.__cost = 0
    # установить переменные стоимости от состояния мира и игрока
    if (monstersCount == 0): self.__boneCost = 0
    elif (arrowsCount > 0):  self.__boneCost = 1
    else:                    self.__boneCost = 6
    if (legsCount == 2):     self.__windCost = 2
    else:                    self.__windCost = 4
    # пересчитать цену пещер
    # если в пещере кости и в мире есть монстры - проверяем соседние пещеры
    if (self.__isBones and monstersCount > 0):
      isDanger = 0
      for direct in self.__nearCavesDict.keys():
        caveId = self.__nearCavesDict[direct]
        cave = self.__world.getCaveById(caveId)
        if (cave == None): 
          isDanger = 1
          break # соседняя пещера не посещена => может быть монстр
      if (isDanger):
        self.__cost += self.__boneCost
    # если в пещере ветер
    if (self.__isWind):
      self.__cost += self.__windCost
    # если в пещере провал
    if (self.__isHole):
      self.__cost += self.__holeCost
    return

# PRIVATE ======================================================================

  # получить id пещеры по её позиции
  def getIdFromPos(self, row, col):
    return int(str(row) + str(col))

  # составить словарь соседних пещер {'direct' : id}
  def getNearCavesDict(self, row, col, allowDirects):
    result = {}
    for direct in allowDirects:
      if (direct == 'Up'):    result[direct] = self.getIdFromPos(row-1, col)
      if (direct == 'Down'):  result[direct] = self.getIdFromPos(row+1, col)
      if (direct == 'Left'):  result[direct] = self.getIdFromPos(row, col-1)
      if (direct == 'Right'): result[direct] = self.getIdFromPos(row, col+1)
    return result
