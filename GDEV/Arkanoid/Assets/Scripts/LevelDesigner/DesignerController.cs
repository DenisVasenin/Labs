using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;


public class DesignerController : MonoBehaviour {

  //[SerializeField] private DesignerUIController designerUIController = null;
  [SerializeField] private Transform cubesContainer = null;

  private List<Renderer> cubesRenderersList = new List<Renderer>();
  private Color currColor = new Color();
  private bool isSaving = false;


  void Start () {
    for (int i = 0; i < cubesContainer.childCount; i++) {
      Transform lineTransform = cubesContainer.GetChild(i);
      for (int j = 0; j < lineTransform.childCount; j++) {
        Transform cubeTransform = lineTransform.GetChild(j);
        Renderer cubeRenderer = cubeTransform.gameObject.GetComponent<Renderer>();
        cubesRenderersList.Add(cubeRenderer);
      }
    }
  }

  void Update () {
    if (!isSaving) {
      if(Input.GetKeyDown(KeyCode.Mouse0)) {
        RaycastHit raycastHit = new RaycastHit();
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        // Vector2 oldPosition = new Vector2(transform.localPosition.x, transform.localPosition.z);
        if (Physics.Raycast(ray, out raycastHit)) {
          if (raycastHit.collider.gameObject.layer == 8) {
            raycastHit.collider.gameObject.GetComponent<Renderer>().material.color = currColor;
          }
        }
      }
    }
  }

  // ==========================================================================

  public void SwitchColor(Color color) {
    currColor = color;
  }

  public void SetSavingState(bool state) {
    isSaving = state;
  }

  public void Return() {
    SceneManager.LoadScene("Menu");
  }

  public void Save(string levelName) {
    if(!Directory.Exists("Levels")) Directory.CreateDirectory("Levels");
    string path = "Levels/" + levelName;
    if(!File.Exists(path)){
      StreamWriter sw = File.CreateText(path);
      foreach (Renderer rend in cubesRenderersList) {
        Color color = rend.material.color;
        if (color == Color.white) sw.Write('W');
        else if (color == Color.red) sw.Write("R");
        else if (color == Color.green) sw.Write('G');
        //else if (color == Color.blue) sw.Write('B');
        else if (color == Color.yellow) sw.Write('Y');
        //else if (color == Color.gray) sw.Write('X');
        else if (color == Color.cyan) sw.Write('C');
      }
      sw.Close();
      SceneManager.LoadScene("Menu");
    } else {
      Debug.Log("filename already exist");
    }
  }


}
