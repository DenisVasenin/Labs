using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;


public class BoardController : MonoBehaviour {

  [SerializeField] private GameController gameController;
  private List<CellController> cellsList;
  private int cellsCount;
  private int dimension;

  // BOARD SETUP ==============================================================

  void Awake() {
    cellsCount = this.transform.childCount;
    dimension = (int)Math.Sqrt(cellsCount);
    cellsList = new List<CellController>();
    for (int i = 0; i < cellsCount; i++) {
      CellController cellController = this.transform.GetChild(i).GetComponent<CellController>();
      cellController.SetCellNumber(i);
      cellsList.Add(cellController);
    }
  }

  public void ResetBoard() {
    for (int i = 0; i < cellsList.Count; i++) {
      cellsList[i].SetCellState(PlayerSide.NONE);
    }
  }

  // ==========================================================================

  public PlayerSide GetRoundState(int cellNumber, int selectedCellsCount) {
    PlayerSide cellValue = cellsList[cellNumber].GetCellState();
    int cellRow = cellNumber / dimension;
    int cellCol = cellNumber % dimension;
    List<int> cellsLine = new List<int>();

    // check vertical line
    GetCellsLine(cellRow, cellCol, -1, 0, cellsLine); // get up
    GetCellsLine(cellRow, cellCol,  1, 0, cellsLine); // get down
    if (CheckLine(cellValue, cellsLine)) return cellValue;
    cellsLine.Clear();
    // check horizontal line
    GetCellsLine(cellRow, cellCol, 0, -1, cellsLine); // get left
    GetCellsLine(cellRow, cellCol, 0,  1, cellsLine); // get right
    if (CheckLine(cellValue, cellsLine)) return cellValue;
    cellsLine.Clear();
    // check left diagonal line
    GetCellsLine(0, 0, 1, 1, cellsLine);
    if (CheckLine(cellValue, cellsLine)) return cellValue;
    cellsLine.Clear();
    // check right diagonal line
    GetCellsLine(0, dimension-1, 1, -1, cellsLine); // get up
    if (CheckLine(cellValue, cellsLine)) return cellValue;
    cellsLine.Clear();
    // check forward
    if (selectedCellsCount == cellsCount) return PlayerSide.BOTH;

    return PlayerSide.NONE;
  }

  private void GetCellsLine(int r, int c, int rowStep, int colStep, List<int> cellsLine) {
    for (int rowIter = r, colIter = c; rowIter >= 0 && colIter >= 0 && rowIter < dimension && colIter < dimension; rowIter += rowStep, colIter += colStep) {
      int cellNumber = rowIter * dimension + colIter;
      cellsLine.Add(cellNumber);
    }
  }

  private bool CheckLine(PlayerSide cellValue, List<int> cellsLine) {
    foreach (int cellNumber in cellsLine) {
      if (cellsList[cellNumber].GetCellState() != cellValue) return false;
    }
    return true;
  }

  public void SetCellState(int cellNumber, PlayerSide cellState) {
    cellsList[cellNumber].SetCellState(cellState);
  }

  // BUTTONS EVENTS ===========================================================

  public void OnClickCell(int cellNumber) {
    gameController.HumanUpdate(cellNumber);
  }


}
