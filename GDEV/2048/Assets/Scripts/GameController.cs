using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class GameController : MonoBehaviour {

  [SerializeField] private InputController inputController = null;
  [SerializeField] private UIController uiController = null;
  [SerializeField] private Transform boardTransform = null;

  private Dictionary<string, Sprite> cellsSpritesAtlas = new Dictionary<string, Sprite>();
  private List<Cell> cellsList = new List<Cell>();
  private List<int> emptyIndexesList = new List<int>();
  private SwipeState swipeState = SwipeState.NONE;
  private int boardWidth = 0;
  private int boardHeight = 0;
  private System.Random rnd = new System.Random();

  // GAME VARS ================================================================
  bool isPause = false, cellsbeMoved = false;
  private int score = 0;



  void Start () {
    GetCellsSprites();
    GetCellsList();
    ResetGame();
    NextStep();
  }

  void Update () {
    if (!isPause) {
      swipeState = inputController.GetSwipeState();
      if (swipeState != SwipeState.NONE) {
        MoveCells(swipeState);
        CheckGameState();
        NextStep();
      }
    }
  }

  // SETUP GAME DATA ===========================================================

  private void GetCellsSprites() {
    Sprite[] sprites = Resources.LoadAll<Sprite>("Sprites/");
    foreach (Sprite sprite in sprites) {
      cellsSpritesAtlas[sprite.name] = sprite;
    }
  }

  private void GetCellsList() {
    boardHeight = boardTransform.childCount;
    for (int row = 0; row < boardHeight; row++) {
      Transform lineTransform = boardTransform.GetChild(row);
      boardWidth = lineTransform.childCount;
      for (int col = 0; col < boardWidth; col++) {
        int cellId = row * boardWidth + col;
        Transform cellTransform = lineTransform.GetChild(col);
        cellsList.Add(new Cell(cellId, cellTransform, cellsSpritesAtlas));
      }
    }
  }

  // SETUP GAME STATE ==========================================================

  public void PauseGame(bool isPaused) {
    isPause = isPaused;
  }

  private void ResetGame() {
    // reset all cells to zero value
    for (int i = 0; i < cellsList.Count; i++) {
      cellsList[i].ResetCell();
    }
    // all cells is clear
    emptyIndexesList.Clear();
    for (int i = 0; i < cellsList.Count; i++) {
      emptyIndexesList.Add(i);
    }
    // reset game data
    isPause = false;
    score = 0;
    uiController.ShowScore(score);
    swipeState = SwipeState.NONE;
  }

  // ==========================================================================

  // add value "2" into random empty board cell
  private void NextStep() {
    int index = GetRandomEmptyIndex();
    cellsList[index].SetCellValue(2);
  }

  // get index of random empty cell from cellsList
  private int GetRandomEmptyIndex() {
    int randomIndex = rnd.Next(0, emptyIndexesList.Count);
    int cellsListIndex = emptyIndexesList[randomIndex];
    emptyIndexesList.RemoveAt(randomIndex);
    return cellsListIndex;
  }

  private void MoveCells(SwipeState swipeState) {
    if (swipeState == SwipeState.RIGHT) {
      MoveCellsToRight();
    }
  }

  private void MoveCellsToRight() {
    List<int> lineValues = new List<int>();
    for (int row = 0; row < boardHeight; row++) {
      lineValues = GetLineValues(row);
    }
  }

  private List<int> GetLineValues(int lineNumber) {
    List<int> lineValues = new List<int>();
    for (int col = 0; col < boardWidth; col++) {
      int index = lineNumber * boardWidth + col;
      lineValues.Add(cellsList[index].GetCellValue());
    }
    return lineValues;
  }

  private GameState CheckGameState() {
    return GameState.NONE;
  }


}
