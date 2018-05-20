using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class UIController : MonoBehaviour {

  [SerializeField] private GameController gameController = null;
  [SerializeField] private Transform scoreBoard = null;

  [SerializeField] private Text scoreField = null;
  [SerializeField] private Button scoreBoardButton = null;
  [SerializeField] private Button returnButton = null;

  void Start () {}

  public void ShowScore(int score) {
    scoreField.text = score.ToString();
  }

  public void OnClickScoreBoardButton() {
    scoreBoard.gameObject.SetActive(true);
    gameController.PauseGame(true);
  }

  public void OnClickReturnButton() {
    scoreBoard.gameObject.SetActive(false);
    gameController.PauseGame(false);
  }


}
