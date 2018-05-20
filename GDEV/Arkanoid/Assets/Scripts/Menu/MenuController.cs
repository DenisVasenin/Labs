using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;


public class MenuController : MonoBehaviour {

  // [SerializeField] private MenuUIController menuUIController = null;
  [SerializeField] private Dropdown dropDown = null;

  private List<Dropdown.OptionData> dropDownOptions = new List<Dropdown.OptionData>();


  void Start() {
    // setup application
    Application.targetFrameRate = 60;
    // setup scene
    List<string> levelsDataList = new List<string>();
    dropDownOptions = dropDown.options;
    StreamReader sr;
    TextAsset textF = (TextAsset)Resources.Load("Levels/default", typeof(TextAsset));
    levelsDataList.Add(textF.text);
    if (Directory.Exists("Levels")) {
      DirectoryInfo di = new DirectoryInfo("Levels");
      FileInfo[] fi = di.GetFiles();
      foreach (FileInfo fiTemp in fi) {
        sr = File.OpenText("Levels/" + fiTemp.Name);
        levelsDataList.Add(sr.ReadLine());
        dropDownOptions.Add(new Dropdown.OptionData(fiTemp.Name));
      }
    }
    SharedData.Instance.SetLevelsData(levelsDataList);
  }

  // ==========================================================================

  public void LoadGame() {
    SharedData.Instance.SetLevelNumber(dropDown.value);
    SceneManager.LoadScene("Game");
  }

  public void LoadDesigner() {
    SceneManager.LoadScene("Designer");
  }

  public void Exit() {
    Application.Quit();
  }


}

