#! /usr/bin/python3


from sys import maxsize
from cave import Cave


# WORLD CLASS ==================================================================

class World:

  __monstersCount   = 0     # количество монстров в мире
  __isKilledMonster = 0     # триггер убийства монстра
  __currCave        = None  # ссылка на текущую пещеру
  __cavesDict       = {}    # словарь известных пещер {caveId:cave}


# PUBLIC =======================================================================

  # обновить состояние мира
  def updateWorld(self, caveRow, caveCol, isGold, isHole, isWind, isBones, allowDirects, monstersCount, arrowsCount, legsCount):
    self.__isKilledMonster = (monstersCount < self.__monstersCount)
    self.__monstersCount = monstersCount
    caveId = self.getCaveIdFromPos(caveRow, caveCol)
    cave = self.__cavesDict.get(caveId)
    # добавить пещеру в словарь если её там нет
    if (cave == None):
      cave = Cave(self, caveRow, caveCol, isGold, isHole, isWind, isBones, allowDirects)
      self.__cavesDict[caveId] = cave
    # установить пещеру как текущую
    self.__currCave = cave
    # обновить стоимость всех известных пещер
    for caveId in self.__cavesDict.keys():
      self.__cavesDict[caveId].updateCost(monstersCount, arrowsCount, legsCount)
    # print('World was updated') # !!! TEST !!!
    return

  # был ли убит монстр на предыдущем ходу?
  def isKilledMonster(self):
    return self.__isKilledMonster

  # получить текущую пещеру
  def getCurrCave(self):
    return self.__currCave

  # получить пещеру по id
  def getCaveById(self, id):
    return self.__cavesDict.get(id)

  # получить id пещеры с наилучшей ценой из посещеных
  # пещеры без неоткрытых направлений отбрасываются
  def getBestCostCaveId(self, currId, currCost):
    targetCaveId = currId
    bestCaveCost = currCost
    for caveId in self.__cavesDict.keys():
      caveCost = self.__cavesDict[caveId].getCost()
      if (caveCost < bestCaveCost):
        # проверить наличие неоткрытых направлений в пещере
        isDeadEnd = 1
        nearCaves = self.getCaveById(caveId).getNearCaves()
        for direct in nearCaves.keys():
          nearCaveId = nearCaves[direct]
          nearCave   = self.getCaveById(nearCaveId)
          if (nearCave == None):
            isDeadEnd = 0
            break
        if (not isDeadEnd):
          bestCaveCost = caveCost
          targetCaveId = caveId
    return targetCaveId

# PRIVATE ======================================================================

  # получить id пещеры по её позиции
  def getCaveIdFromPos(self, row, col):
    return int(str(row) + str(col))
