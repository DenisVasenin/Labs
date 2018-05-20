#! /usr/bin/python3


import random
from operator import itemgetter


# PLAYER CLASS =================================================================

class Player:

  # ссылка на обьект мира
  __world       = None

  # параметры игрока
  __arrowsCount = 0        # количество стрел
  __legsCount   = 0        # количество ног
  __currDirect  = 0        # текущее направление
  __currCave    = None     # текущая пещера
  __isShoot     = False

  __passiveAct  = 'noAct'  # пассивное действие
  __activeAct   = 'noAct'  # активное действие
  __currPath    = []       # стек текущего пути

  __pasActions  = ('noAct', 'onLeft', 'upSideDn', 'onRight')
  __actActions  = ('noAct', 'Go', 'Shoot', 'Take')
  __allDirects  = ('Up', 'Right', 'Down', 'Left')


  def __init__(self, world):
    self.__world = world
    return

# PUBLIC =======================================================================

  def updatePlayer(self, arrowsCount, legsCount, currDirect):
    self.__arrowsCount = arrowsCount
    self.__legsCount   = legsCount
    self.__currDirect  = currDirect
    self.__currCave = self.__world.getCurrCave()
    return

# PRIVATE ======================================================================

  # выбрать случайное направление из доступных 
  # getRandomDirect(['Left', 'Down']) -> return 'Left' or 'Down'
  def getRandomDirect(self, allowDirects):
    return allowDirects[random.randint(0, len(allowDirects) - 1)]

  # выбрать противоположное направление
  # GetBackDirect('Up') -> return 'Down'
  def getBackDirect(self, currDirect):
    return self.__allDirects[(self.__allDirects.index(currDirect) + 2) % 4]

  # выбрать действие для поворота от текущего направления к выбранному
  # GetRotateAction("Left", "Right") -> return 'upSideDn'
  def getRotateAction(self, currDirect, nextDirect):
    return self.__pasActions[(self.__allDirects.index(currDirect) - self.__allDirects.index(nextDirect) + 4) % 4]
  
################################################################################

# COST TO ACTS
## 0    - free go                        # go next
## 1    - bone shoot                     # shoot
## 2    - wind go                        # go next
## 3    - bone shoot & wind go           # shoot
## 4    - wind not go                    # comeback
## 5    - bone shoot & wind not go       # comeback
## 6    - bone not shoot                 # comeback
## 8    - bone not shoot & wind go       # comeback
## 10   - bone not shoot & wind not go   # comeback
## 10   - hole not go                    # comeback
  
  # выбрать текущие действия
  def getActions(self):
    currActs = []
    if (self.__currCave.isGold()):
      self.__passiveAct = 'noAct'
      self.__activeAct  = 'Take'
    else:
      if (self.__isShoot):
        self.__isShoot = False
        self.directGo(self.__currDirect)
      elif (self.__currCave.isHole()):
        self.randomGo()
      else:
        # построить путь до пещеры с наименьшим cost
        if (len(self.__currPath) == 0):
          self.__currPath = self.getDirectsList()
        # если путь пуст - выбрать случайное непосещенное направление
        if (len(self.__currPath) == 0):
          currCost = self.__currCave.getCost()
          if (currCost == 0 or currCost == 2):
            self.randomGo()
          elif (currCost == 1 or currCost == 3):
            self.randomShoot()
          else: # comeback
            self.randomGo()
        else: # если не пуст - продвинуться по нему на шаг
          print('Stack')
          nextDirect = self.__currPath.pop()
          self.directGo(nextDirect)
    print('Действие: ', self.__activeAct) # !!! TEST !!!
    currActs.append(self.__passiveAct)
    currActs.append(self.__activeAct)
    return currActs


  def randomGo(self):
    self.__passiveAct = self.getRotateAction(self.__currDirect, self.getRandomPossibleDirect())
    self.__activeAct  = self.__actActions[1]
    return


  def directGo(self, targetDirect):
    print('Выбраное направление:', targetDirect) # !!! TEST !!!
    self.__passiveAct = self.getRotateAction(self.__currDirect, targetDirect)
    self.__activeAct  = self.__actActions[1]
    return


  def randomShoot(self):
    self.__isShoot = True
    self.__passiveAct = self.getRotateAction(self.__currDirect, self.getRandomPossibleDirect())
    self.__activeAct  = self.__actActions[2]
    return


  def directShoot(self, targetDirect):
    self.__isShoot = True
    print('Выбраное направление:', targetDirect) # !!! TEST !!!
    self.__passiveAct = self.getRotateAction(self.__currDirect, targetDirect)
    self.__activeAct  = self.__actActions[2]
    return


  def getRandomPossibleDirect(self):
    nearCaves       = self.__currCave.getNearCaves()
    possibleDirects = []
    allDirects = []
    for direct in nearCaves.keys():
      caveId = nearCaves[direct]
      cave   = self.__world.getCaveById(caveId)
      allDirects.append(direct)
      if (cave == None):
        possibleDirects.append(direct)
    if (len(possibleDirects) > 0):
      nextDirect = self.getRandomDirect(possibleDirects)
    else:
      nextDirect = self.getRandomDirect(allDirects)
    print('Возможные направления: ', possibleDirects) # !!! TEST !!!
    print('Выбраное направление:', nextDirect) # !!! TEST !!!
    return nextDirect

# astar ========================================================================

  def getDirectsList(self):
    currCave          = self.__currCave
    currCaveId        = currCave.getId()
    currCaveCost      = currCave.getCost()
    targetCaveId      = self.__world.getBestCostCaveId(currCaveId, currCaveCost)
    startNode         = { 'parentNodeId': -1, 'nodeId': 0, 'nodePriority': 0, 'prevCaveId': -1, 'caveId': currCaveId, 'caveCost': currCaveCost, 'direct': 'None' }
    allNodesList      = [startNode] # список сгенерированных узлов
    expandNodesQueue  = []          # очередь узлов на раскрытие
    directsList       = []          # путь решения
    qNode = (0, 0)       # (nodeId, nodePriority)
    while (currCaveId != targetCaveId):
      nodesIdList = self.expandNode(qNode[0], allNodesList, currCaveCost, targetCaveId)
      self.updateExpandNodesQueue(nodesIdList, expandNodesQueue, allNodesList)
      qNode = expandNodesQueue.pop(0)
      currCave = self.__world.getCaveById(allNodesList[qNode[0]]['caveId'])
      currCaveId = currCave.getId()
    currNode = allNodesList[qNode[0]]
    while (currNode['nodeId'] != startNode['nodeId']):
      directsList.append(currNode['direct'])
      currNode = allNodesList[currNode['parentNodeId']]
    return(directsList)


  # раскрыть текущий узел
  # nodesIdList = [node1, node2, ...]  - список id дочерних узлов в allNodesList
  def expandNode(self, currNodeId, allNodesList, currCaveCost, targetCaveId):
    nodesIdList   = []
    # get expanding node from all nodes list
    currNode      = allNodesList[currNodeId]
    # get curr cave from expand node
    prevCaveId    = currNode['prevCaveId']
    currCaveId    = currNode['caveId']
    currCave      = self.__world.getCaveById(currCaveId)
    # get dict {'direct': caveId} from curr cave
    nearCaves     = currCave.getNearCaves()
    for direct in nearCaves.keys():
      nextCaveId  = nearCaves[direct]
      if (nextCaveId != prevCaveId):
        nextCave  = self.__world.getCaveById(nextCaveId)
        if (nextCave != None):
          nextCaveCost = nextCave.getCost()
          if (nextCaveCost < currCaveCost):
            newNodeId  = len(allNodesList)
            newNodePriority = self.getNodePriority(currNode['nodePriority'], nextCaveId, targetCaveId)
            newNode    = { 'parentNodeId': currNodeId, 'nodeId': newNodeId, 'nodePriority': newNodePriority, 'prevCaveId': currCaveId, 'caveId': nextCaveId, 'caveCost': nextCaveCost, 'direct': direct }
            allNodesList.append(newNode)
            nodesIdList.append(newNodeId)
    return nodesIdList


  def updateExpandNodesQueue(self, nodesIdList, expandNodesQueue, allNodesList):
    if(len(nodesIdList) > 0):
      for i in range(len(nodesIdList)):
        nodeId       = nodesIdList[i]
        nodePriority = allNodesList[nodeId]['nodePriority']
        expandNodesQueue.append((nodeId, nodePriority))
      expandNodesQueue.sort(key=itemgetter(1), reverse=False)
    return


  def getNodePriority(self, nodePriority, caveId, targetCaveId):
    caveRow   = caveId // 10
    caveCol   = caveId % 10
    targetRow = targetCaveId // 10
    targetCol = targetCaveId % 10
    priority  = nodePriority + 1 + abs(caveRow - targetRow) + abs(caveCol - targetCol)
    return priority
