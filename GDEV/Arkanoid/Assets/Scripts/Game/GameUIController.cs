using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class GameUIController : MonoBehaviour {

  //[SerializeField] private GameController gameController = null;
  [SerializeField] private Transform boardTransform = null;
  [SerializeField] private Transform infoTransform = null;
  [SerializeField] private Transform scoresTransform = null;
  [SerializeField] private Transform livesTransform = null;
  [SerializeField] private Sprite zeroLiveSprite = null;
  [SerializeField] private Sprite oneLiveSprite = null;
  [SerializeField] private Sprite twoLiveSprite = null;
  [SerializeField] private Sprite threeLiveSprite = null;

  private Material boardMaterial = null;
  private float H = 0, S = 0.8f, V = 0.3f;


  void Start() {
    boardMaterial = boardTransform.GetComponent<Renderer>().material;
    StartCoroutine(CirclingBoardColor());
  }

  // ==========================================================================

  public void ShowInfo(bool isRoundBegin, RoundState roundState) {
    if (isRoundBegin) infoTransform.gameObject.SetActive(false);
    else StartCoroutine(ShowRoundInfo(roundState));
  }

  public void ShowScore(int cost) {
    scoresTransform.GetComponent<Text>().text = cost.ToString();
  }

  public void ShowLives(int count) {
    if (count == 0) livesTransform.GetComponent<Image>().sprite = zeroLiveSprite;
    if (count == 1) livesTransform.GetComponent<Image>().sprite = oneLiveSprite;
    if (count == 2) livesTransform.GetComponent<Image>().sprite = twoLiveSprite;
    if (count == 3) livesTransform.GetComponent<Image>().sprite = threeLiveSprite;
  }

  // COROUTINES ===============================================================

  private IEnumerator CirclingBoardColor() {
    while (true) {
      boardMaterial.color = Color.HSVToRGB(H, S, V);
      if (H < 1) H += 0.001f;
      else H = 0;
      yield return null;
    }
  }

  private IEnumerator ShowRoundInfo(RoundState roundState) {
    string tmp = infoTransform.GetComponent<Text>().text;
    if (roundState == RoundState.WIN) {
      infoTransform.GetComponent<Text>().text = "YOU WIN";
      scoresTransform.GetComponent<Text>().text = "0";
    } else if (roundState == RoundState.LOSE) {
      infoTransform.GetComponent<Text>().text = "YOU LOSE";
      scoresTransform.GetComponent<Text>().text = "0";
    } else if (roundState == RoundState.FAIL) {
      infoTransform.GetComponent<Text>().text = "TRY AGAIN";
    }
    infoTransform.gameObject.SetActive(true);
    yield return new WaitForSeconds(2.0f);
    infoTransform.GetComponent<Text>().text = tmp;
  }


}
