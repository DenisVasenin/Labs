using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class MenuUIController : MonoBehaviour {

  [SerializeField] private MenuController menuController = null;

  // [SerializeField] private Button playButton = null;
  // [SerializeField] private Button designerButton = null;
  // [SerializeField] private Button exitButton = null;


  public void OnClickPlayButton() {
    menuController.LoadGame();
  }

  public void OnClickDesignerButton() {
    menuController.LoadDesigner();
  }

  public void OnClickExitButton() {
    menuController.Exit();
  }


}
