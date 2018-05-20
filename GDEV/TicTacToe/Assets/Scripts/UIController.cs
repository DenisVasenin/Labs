using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class UIController : MonoBehaviour {

  [SerializeField] private GameController gameController;
  [SerializeField] private Button undoButton;
  [SerializeField] private Button playButton;
  [SerializeField] private Button roundEndButton;
  [SerializeField] private Button playerOneTypeButton;
  [SerializeField] private Button playerOneSideButton;
  [SerializeField] private Button playerTwoTypeButton;
  [SerializeField] private Button playerTwoSideButton;
  private Text undoButtonText;
  private Text playButtonText;
  private Text roundEndButtonText;
  private Text playerOneTypeButtonText;
  private Text playerOneSideButtonText;
  private Text playerTwoTypeButtonText;
  private Text playerTwoSideButtonText;

  // MENU SETUP ===============================================================

  void Awake() {
    playButtonText = playButton.GetComponentInChildren<Text>();
    undoButtonText = undoButton.GetComponentInChildren<Text>();
    roundEndButtonText = roundEndButton.GetComponentInChildren<Text>();
    playerOneTypeButtonText = playerOneTypeButton.GetComponentInChildren<Text>();
    playerOneSideButtonText = playerOneSideButton.GetComponentInChildren<Text>();
    playerTwoTypeButtonText = playerTwoTypeButton.GetComponentInChildren<Text>();
    playerTwoSideButtonText = playerTwoSideButton.GetComponentInChildren<Text>();
  }

  public void ResetMenu() {
    SetButtonText(ButtonType.PLAYER_ONE_TYPE, "Human");
    SetButtonText(ButtonType.PLAYER_TWO_TYPE, "Human");
    SetButtonText(ButtonType.PLAYER_ONE_SIDE, "X");
    SetButtonText(ButtonType.PLAYER_TWO_SIDE, "O");
    SetDefaultButtonsState();
  }

  public void SetDefaultButtonsState() {
    SetButtonActive(ButtonType.ROUND_END, false);
    SetButtonInteractible(ButtonType.UNDO, false);
    SetButtonInteractible(ButtonType.PLAY, true);
    SetButtonInteractible(ButtonType.PLAYER_ONE_TYPE, true);
    SetButtonInteractible(ButtonType.PLAYER_ONE_SIDE, true);
    SetButtonInteractible(ButtonType.PLAYER_TWO_TYPE, true);
    SetButtonInteractible(ButtonType.PLAYER_TWO_SIDE, true);
  }

  // BUTTONS EVENTS ===========================================================

  public void OnClickPlayButton() {
    SetButtonInteractible(ButtonType.PLAY, false);
    SetButtonInteractible(ButtonType.PLAYER_ONE_TYPE, false);
    SetButtonInteractible(ButtonType.PLAYER_ONE_SIDE, false);
    SetButtonInteractible(ButtonType.PLAYER_TWO_TYPE, false);
    SetButtonInteractible(ButtonType.PLAYER_TWO_SIDE, false);
    gameController.StartPlaying();
  }

  public void OnClickUndoButton() {
    gameController.Undo();
  }

  public void OnClickExitButton() {
    gameController.CloseApplication();
  }

  public void OnClickRoundEndButton() {
    SetButtonActive(ButtonType.ROUND_END, false);
    gameController.ResetGameState();
  }

  public void OnClickPlayerOneTypeButton() {
    OnClickPlayerTypeButton(1);
  }

  public void OnClickPlayerTwoTypeButton() {
    OnClickPlayerTypeButton(2);
  }

  public void OnClickPlayerOneSideButton() {
    OnClickPlayerSideButton();
  }

  public void OnClickPlayerTwoSideButton() {
    OnClickPlayerSideButton();
  }

  private void OnClickPlayerTypeButton(int i) {
    gameController.SwitchPlayerType(i);
    if (i == 1) {
      if (playerOneTypeButtonText.text == "Human") {
        SetButtonText(ButtonType.PLAYER_ONE_TYPE, "AI");
      } else {
        SetButtonText(ButtonType.PLAYER_ONE_TYPE, "Human");
      }
    } else {
      if (playerTwoTypeButtonText.text == "Human") {
        SetButtonText(ButtonType.PLAYER_TWO_TYPE, "AI");
      } else {
        SetButtonText(ButtonType.PLAYER_TWO_TYPE, "Human");
      }
    }
  }

  private void OnClickPlayerSideButton() {
    gameController.SwitchPlayersSide();
    if (playerOneSideButtonText.text == "O") {
      SetButtonText(ButtonType.PLAYER_ONE_SIDE, "X");
      SetButtonText(ButtonType.PLAYER_TWO_SIDE, "O");
    } else {
      SetButtonText(ButtonType.PLAYER_ONE_SIDE, "O");
      SetButtonText(ButtonType.PLAYER_TWO_SIDE, "X");
    }
  }

  // SET BUTTONS STATE ========================================================

  public void SetButtonActive(ButtonType type, bool state) {
    if (type == ButtonType.UNDO) undoButton.gameObject.SetActive(state);
    else if (type == ButtonType.PLAY) playButton.gameObject.SetActive(state);
    else if (type == ButtonType.ROUND_END) roundEndButton.gameObject.SetActive(state);
    else if (type == ButtonType.PLAYER_ONE_TYPE) playerOneTypeButton.gameObject.SetActive(state);
    else if (type == ButtonType.PLAYER_TWO_TYPE) playerTwoTypeButton.gameObject.SetActive(state);
    else if (type == ButtonType.PLAYER_ONE_SIDE) playerOneSideButton.gameObject.SetActive(state);
    else if (type == ButtonType.PLAYER_TWO_SIDE) playerTwoSideButton.gameObject.SetActive(state);
  }

  public void SetButtonInteractible(ButtonType type, bool state) {
    if (type == ButtonType.UNDO) undoButton.interactable = state;
    else if (type == ButtonType.PLAY) playButton.interactable = state;
    else if (type == ButtonType.ROUND_END) roundEndButton.interactable = state;
    else if (type == ButtonType.PLAYER_ONE_TYPE) playerOneTypeButton.interactable = state;
    else if (type == ButtonType.PLAYER_TWO_TYPE) playerTwoTypeButton.interactable = state;
    else if (type == ButtonType.PLAYER_ONE_SIDE) playerOneSideButton.interactable = state;
    else if (type == ButtonType.PLAYER_TWO_SIDE) playerTwoSideButton.interactable = state;
  }

  public void SetButtonText(ButtonType type, string text) {
    if (type == ButtonType.UNDO) undoButtonText.text = text;
    else if (type == ButtonType.PLAY) playButtonText.text = text;
    else if (type == ButtonType.ROUND_END) roundEndButtonText.text = text;
    else if (type == ButtonType.PLAYER_ONE_TYPE) playerOneTypeButtonText.text = text;
    else if (type == ButtonType.PLAYER_TWO_TYPE) playerTwoTypeButtonText.text = text;
    else if (type == ButtonType.PLAYER_ONE_SIDE) playerOneSideButtonText.text = text;
    else if (type == ButtonType.PLAYER_TWO_SIDE) playerTwoSideButtonText.text = text;
  }


}
