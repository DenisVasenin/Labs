using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class DesignerUIController : MonoBehaviour {

  [SerializeField] private DesignerController designerController = null;

  //[SerializeField] private Transform cubesContainer = null;
  [SerializeField] private Transform savePanel = null;

  [SerializeField] private Button colorButton = null;
  [SerializeField] private Button returnButton = null;
  [SerializeField] private Button saveButton = null;

  [SerializeField] private Color red = Color.red;
  [SerializeField] private Color green = Color.green;
  [SerializeField] private Color blue = Color.blue;
  [SerializeField] private Color yellow = Color.yellow;
  [SerializeField] private Color gray = Color.gray;
  [SerializeField] private Color white = Color.white;
  [SerializeField] private Color cyan= Color.cyan;

  private List<Color> colorsList = new List<Color>();
  private Color currColor = new Color();
  private int colorIterator = 0;


  void Start() {
    SetColors();
    currColor = colorsList[colorIterator];
    colorButton.GetComponentInChildren<Image>().color = currColor;
    designerController.SwitchColor(currColor);
  }

  public void SetColors() {
    //colorsList.Add(new Color(gray.r, gray.g, gray.b, gray.a));
    colorsList.Add(new Color(red.r, red.g, red.b, red.a));
    colorsList.Add(new Color(green.r, green.g, green.b, green.a));
    //colorsList.Add(new Color(blue.r, blue.g, blue.b, blue.a));
    colorsList.Add(new Color(yellow.r, yellow.g, yellow.b, yellow.a));
    colorsList.Add(new Color(cyan.r, cyan.g, cyan.b, cyan.a));
    colorsList.Add(new Color(white.r, white.g, white.b, white.a));
  }

  // DESIGNER =================================================================

  public void OnClickColorButton() {
    SwitchColor();
    colorButton.GetComponentInChildren<Image>().color = currColor;
  }

  public void OnClickReturnButton() {
    designerController.Return();
  }

  public void OnClickSaveButton() {
    colorButton.interactable = false;
    saveButton.interactable = false;
    returnButton.interactable = false;
    savePanel.gameObject.SetActive(true);
    designerController.SetSavingState(true);
  }

  public void OnClickAcceptButton() {
    string levelName = savePanel.Find("InputField").Find("Text").GetComponent<Text>().text;
    designerController.Save(levelName);
  }

  public void OnClickDiscardButton() {
    colorButton.interactable = true;
    saveButton.interactable = true;
    returnButton.interactable = true;
    savePanel.gameObject.SetActive(false);
    designerController.SetSavingState(false);
  }

  public void SwitchColor() {
    colorIterator++;
    if (colorIterator >= colorsList.Count) colorIterator = 0;
    currColor = colorsList[colorIterator];
    designerController.SwitchColor(currColor);
  }


}
