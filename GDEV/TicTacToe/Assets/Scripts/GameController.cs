using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class GameController : MonoBehaviour {

  [SerializeField] private UIController uiController;
  [SerializeField] private BoardController boardController;
  private Player playerOne, playerTwo, currPlayer;
  private bool isPlay, isAI, isHuman;
  private int roundCount;
  private Queue<Player> playersQueue; // queue players step
  private Stack<int> undoStack; // contain selected cells numbers

  // GAME SETUP ===============================================================
  void Awake() {
    Application.targetFrameRate = 60;
    QualitySettings.vSyncCount = 0;

    isPlay = false;
    roundCount = 0;
    playerOne = new Player();
    playerTwo = new Player();
    playersQueue = new Queue<Player>();
    undoStack = new Stack<int>();
    ResetGameData();
  }

  private void ResetGameData() {
    isAI = false;
    isHuman = false;
    playerOne.SetPlayerType(PlayerType.HUMAN);
    playerTwo.SetPlayerType(PlayerType.HUMAN);
    playerOne.SetPlayerSide(PlayerSide.X);
    playerTwo.SetPlayerSide(PlayerSide.O);
    if (roundCount > 0) {
      playersQueue.Clear();
      undoStack.Clear();
      boardController.ResetBoard();
      uiController.ResetMenu();
    }
  }

  private void StopPlaying(PlayerSide winSide) {
    isPlay = false;
    string message = "";
    if (winSide == playerOne.GetPlayerSide()) message = "PLAYER 1 WIN";
    else if (winSide == playerTwo.GetPlayerSide()) message = "PLAYER 2 WIN";
    else message = "DRAW";
    uiController.SetButtonActive(ButtonType.ROUND_END, true);
    uiController.SetButtonText(ButtonType.ROUND_END, message);
    uiController.SetButtonInteractible(ButtonType.UNDO, false);
  }

  // STEP UPDATE ==============================================================

  void FixedUpdate() {
    if (isPlay && isAI) {
      currPlayer = playersQueue.Peek();
      if (currPlayer.GetPlayerType() == PlayerType.AI) {
        int cellNumber = currPlayer.SimpleAIStep(undoStack);
        undoStack.Push(cellNumber);
        playersQueue.Enqueue(currPlayer);
        playersQueue.Dequeue();
        boardController.SetCellState(cellNumber, currPlayer.GetPlayerSide());
        uiController.SetButtonInteractible(ButtonType.UNDO, true);
        PlayerSide winSide = boardController.GetRoundState(cellNumber, undoStack.Count);
        if (winSide != PlayerSide.NONE) StopPlaying(winSide);
      }
    }
  }

  public void HumanUpdate(int cellNumber) {
    if (isPlay && isHuman) {
      currPlayer = playersQueue.Peek();
      if (currPlayer.GetPlayerType() == PlayerType.HUMAN) {
        if (!undoStack.Contains(cellNumber)) {
          undoStack.Push(cellNumber);
          playersQueue.Enqueue(currPlayer);
          playersQueue.Dequeue();
          boardController.SetCellState(cellNumber, currPlayer.GetPlayerSide());
          uiController.SetButtonInteractible(ButtonType.UNDO, true);
          PlayerSide winSide = boardController.GetRoundState(cellNumber, undoStack.Count);
          if (winSide != PlayerSide.NONE) StopPlaying(winSide);
        }
      }
    }
  }

  // MENU BUTTONS EVENTS ======================================================

  public void StartPlaying() {
    isPlay = true;
    roundCount++;
    if (playerOne.GetPlayerType() == PlayerType.AI || playerTwo.GetPlayerType() == PlayerType.AI) isAI = true;
    if (playerOne.GetPlayerType() == PlayerType.HUMAN || playerTwo.GetPlayerType() == PlayerType.HUMAN) isHuman = true;
    if (playerOne.GetPlayerSide() == PlayerSide.X) {
      playersQueue.Enqueue(playerOne);
      playersQueue.Enqueue(playerTwo);
    } else {
      playersQueue.Enqueue(playerTwo);
      playersQueue.Enqueue(playerOne);
    }
  }

  public void Undo() {
    int cellNumber = undoStack.Pop();
    currPlayer = playersQueue.Dequeue();
    playersQueue.Enqueue(currPlayer);
    boardController.SetCellState(cellNumber, PlayerSide.NONE);
    if (undoStack.Count == 0) uiController.SetButtonInteractible(ButtonType.UNDO, false);
  }

  public void SwitchPlayerType(int playerNumber) {
    if (playerNumber == 1) {
      if (playerOne.GetPlayerType() == PlayerType.HUMAN) playerOne.SetPlayerType(PlayerType.AI);
      else playerOne.SetPlayerType(PlayerType.HUMAN);
    } else {
      if (playerTwo.GetPlayerType() == PlayerType.HUMAN) playerTwo.SetPlayerType(PlayerType.AI);
      else playerTwo.SetPlayerType(PlayerType.HUMAN);
    }
  }

  public void SwitchPlayersSide() {
    if (playerOne.GetPlayerSide() == PlayerSide.X) {
      playerOne.SetPlayerSide(PlayerSide.O);
      playerTwo.SetPlayerSide(PlayerSide.X);
    } else {
      playerOne.SetPlayerSide(PlayerSide.X);
      playerTwo.SetPlayerSide(PlayerSide.O);
    }
  }

  public void ResetGameState() {
    ResetGameData();
  }

  public void CloseApplication() {
    Application.Quit();
  }


}
