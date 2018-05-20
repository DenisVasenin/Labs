using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Player {

  private PlayerType playerType;
  private PlayerSide playerSide;
  private System.Random rnd;

  public Player() {
    rnd = new System.Random();
  }

  public PlayerType GetPlayerType() {
    return playerType;
  }

  public PlayerSide GetPlayerSide() {
    return playerSide;
  }

  public void SetPlayerType(PlayerType type) {
    playerType = type;
  }

  public void SetPlayerSide(PlayerSide side) {
    playerSide = side;
  }

  public int SimpleAIStep(Stack<int> undoStack) {
    int i;
    do {
      i = rnd.Next(0, 9);
    } while(undoStack.Contains(i));
    return i;
  }


}
