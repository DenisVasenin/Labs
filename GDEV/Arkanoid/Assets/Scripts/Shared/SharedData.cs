using System.Collections;
using System.Collections.Generic;
using UnityEngine;


class SharedData {

  private List<string> levelsDataList;
  private string currLevelData;
  private int currLevelNumber;
  private float plSpeed = 30, blSpeed = 20;
  private float maxSpeed = 50;

  // singleton
  private static readonly SharedData _instance = new SharedData();
  public static SharedData Instance{ get { return _instance; } }
  static SharedData() {}

  public void ResetData() {
    plSpeed = 30;
    blSpeed = 20;
  }

  public void SetLevelsData(List<string> dataList) {
    levelsDataList = dataList;
  }

  public void SetLevelNumber(int levelNumber) {
    currLevelNumber = levelNumber;
    currLevelData = levelsDataList[currLevelNumber];
  }

  public void SetPlayerSpeed(float speed) {
    if (speed < maxSpeed) plSpeed = speed;
    else plSpeed = maxSpeed;
  }

  public void SetBallSpeed(float speed) {
    blSpeed = speed;
  }

  public Color GetColor(char color) {
    if (color == 'R') return Color.red;
    else if (color == 'G') return Color.green;
    //else if (color == 'B') return Color.blue;
    else if (color == 'Y') return Color.yellow;
    //else if (color == 'X') return Color.gray;
    else if (color == 'C') return Color.cyan;
    return Color.white;
  }

  public int levelNumber { get { return currLevelNumber; } }
  public string levelData { get { return currLevelData; } }

  public float playerSpeed { get { return plSpeed; } }
  public float ballSpeed { get { return blSpeed; } }


  // public AudioClip ballCollideBorder { get { return ballCollideBorderClip; } }
  // public AudioClip ballCollidePlayer { get { return ballCollidePlayerClip; } }
  // public AudioClip ballCollideFailLine { get { return ballCollideFailLineClip; } }
  // public AudioClip ballCollideScoreCube { get { return ballCollideScoreCubeClip; } }


  public bool isLeft { get { return Input.GetKey("left"); } }
  public bool isRight { get { return Input.GetKey("right"); } }
  public bool isSpace { get { return Input.GetKey("space"); } }
  public bool isEsc { get { return Input.GetKey("escape"); } }


}
