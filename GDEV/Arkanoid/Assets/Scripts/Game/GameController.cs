using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class GameController : MonoBehaviour {

  [SerializeField] private GameUIController gameUIController = null;
  [SerializeField] private GameSoundController gameSoundController = null;

  [SerializeField] private Transform boardTransform = null;
  [SerializeField] private Transform cubesTransform = null;
  [SerializeField] private Transform playerTransform = null;
  [SerializeField] private Transform ballTransform = null;
  [SerializeField] private Transform backWallTransform = null;
  [SerializeField] private Transform failLineTransform = null;

  private List<ITouchible> objectsList = new List<ITouchible>();
  private List<ITouchible> cubesList = new List<ITouchible>();
  private List<ITouchible> toDeleteObjectsList = new List<ITouchible>();

  private HashSet<int> idSet = new HashSet<int>();
  private System.Random rnd = new System.Random();

  // GAME VARS ================================================================

  private bool isRoundBegin = false;
  private int levelNumber;
  private int score = 0, lives = 3;
  private GameObject twiceBallObj = null;

  // GAME =====================================================================

  void Start () {
    Cursor.visible = false;
    objectsList.Add(new Player(AddObjectId(), playerTransform.GetComponent<Collider>(), this));
    objectsList.Add(new Ball(AddObjectId(), ballTransform.GetComponent<Collider>(), this));
    objectsList.Add(new FailLine(AddObjectId(), failLineTransform.GetComponent<Collider>(), this));
    for (int i = 0; i < boardTransform.childCount; i++) {
      objectsList.Add(new Border(AddObjectId(), boardTransform.GetChild(i).GetComponent<Collider>(), this));
    }
    levelNumber = SharedData.Instance.levelNumber;
    LoadLevel(levelNumber);
  }

  void Update() {
    if (SharedData.Instance.isEsc) {
      Cursor.visible = true;
      SceneManager.LoadScene("Menu");
    }
    if (cubesList.Count == 0) StopRound(RoundState.WIN);
    if (!isRoundBegin) {
      if (SharedData.Instance.isSpace) StartRound();
    }
  }

  void FixedUpdate() {
    if (isRoundBegin) {
      DeleteObjects();
      for (int i = 0; i < objectsList.Count; i++) {
        objectsList[i].Update();
      }
      for (int i = 0; i < cubesList.Count; i++) {
        cubesList[i].Update();
      }
    }
  }

  // ROUND ====================================================================

  private void StartRound() {
    isRoundBegin = true;
    gameUIController.ShowInfo(true, RoundState.NONE);
    StartCoroutine(GrowBallSpeed());
  }

  public void StopRound(RoundState roundState) {
    isRoundBegin = false;
    if (roundState == RoundState.FAIL) {
      lives--;
      if (lives < 1) roundState = RoundState.LOSE;
      gameUIController.ShowLives(lives);
    }
    gameUIController.ShowInfo(false, roundState);
    if (roundState == RoundState.LOSE || roundState == RoundState.WIN) {
      Cursor.visible = true;
      SceneManager.LoadScene("Menu");
    }
    StopCoroutine(GrowBallSpeed());
    ResetObjects();
    SharedData.Instance.ResetData();
  }

  // LEVEL ====================================================================

  private void ChangeLevel(int nextLevelNumber) {
    UnloadLevel();
    LoadLevel(nextLevelNumber);
  }

  private void LoadLevel(int levelNumber) {
    SharedData.Instance.SetLevelNumber(levelNumber);
    string levelData = SharedData.Instance.levelData;
    int charIndex = 0;
    for (int row = 0; row < cubesTransform.childCount; row++) {
      Transform lineTransform = cubesTransform.GetChild(row);
      for (int col = 0; col < lineTransform.childCount; col++) {
        Transform cubeTransform = lineTransform.GetChild(col);
        Material cubeMaterial = cubeTransform.gameObject.GetComponent<Renderer>().material;
        Color color = SharedData.Instance.GetColor(levelData[charIndex]);
        if (color == Color.white) {
          cubeTransform.gameObject.SetActive(false);
        } else {
          cubeTransform.gameObject.SetActive(true);
          cubeMaterial.color = color;
          cubesList.Add(new Cube(AddObjectId(), color, cubeTransform.GetComponent<Collider>(), this));
        }
        charIndex++;
      }
    }
  }

  private void UnloadLevel() {
    ResetObjects();
    foreach (ITouchible cube in cubesList) DeleteObjectId(cube.GetObjectId());
    cubesList.Clear();
  }

  // OBJECTS ==================================================================

  public void AddObjectToDelete(ITouchible obj) {
    toDeleteObjectsList.Add(obj);
  }

  private void DeleteObjects() {
    for (int i = 0; i < toDeleteObjectsList.Count; i++) {
      DeleteObjectId(toDeleteObjectsList[i].GetObjectId());
      objectsList.Remove(toDeleteObjectsList[i]);
      cubesList.Remove(toDeleteObjectsList[i]);
    }
    toDeleteObjectsList.Clear();
  }

  private void ResetObjects() {
    for (int i = 0; i < objectsList.Count; i++) {
      objectsList[i].Reset();
    }
  }

  // OBJECT ID ================================================================

  private int AddObjectId() {
    int id = rnd.Next(1, 10000);
    while (idSet.Contains(id)) {
      id = rnd.Next(1, 10000);
    }
    idSet.Add(id);
    return id;
  }

  private void DeleteObjectId(int id) {
    idSet.Remove(id);
  }

  // BONUSES ==================================================================

  public void EnableBonuse(CubeType bonuseType, Transform cubeTransform) {
    if (bonuseType == CubeType.SCORE) {
      score += 10;
      gameUIController.ShowScore(score);
      PlaySound("collideScoreCube");
      StartCoroutine(BonuceFall(bonuseType, cubeTransform, Vector3.up));
    } else {
      PlaySound("collideOtherCube");
      StartCoroutine(BonuceFall(bonuseType, cubeTransform, -Vector3.forward));
    }
  }

  private IEnumerator BonuceFall(CubeType bonuseType, Transform cubeTransform, Vector3 direct) {
    Animation anim = cubeTransform.GetComponent<Animation>();
    anim.Play("AnimCube1");
    Vector3 startPos = cubeTransform.position;
    Quaternion startRot = cubeTransform.rotation;
    float speed = 10;
    bool isAnimated = false;
    while (true) {
      cubeTransform.Translate(direct * speed * Time.deltaTime);
      if (bonuseType == CubeType.SCORE) {
        if (cubeTransform.position.y > 50) break;
      } else {
        if (cubeTransform.position.z < -20 && !isAnimated) {
          isAnimated = true;
          anim.Play("AnimCube2");
        }
        if (cubeTransform.position.z < failLineTransform.position.z) break;
        if (cubeTransform.position.z - playerTransform.position.z < 1 && Mathf.Abs(cubeTransform.position.x - playerTransform.position.x) < 8) {
          if (bonuseType == CubeType.WALL) {
            StartCoroutine(BonuceBackWall());
          }
          if (bonuseType == CubeType.HEALTH) {
            if (lives < 3) lives++;
            gameUIController.ShowLives(lives);
          }
          if (bonuseType == CubeType.BALL) {
            StartCoroutine(BonuceTwiceBall());
          }
          break;
        }
      }
      yield return null;
    }
    anim.Stop();
    cubeTransform.gameObject.SetActive(false);
    cubeTransform.position = startPos;
    cubeTransform.rotation = startRot;
  }

  private IEnumerator BonuceBackWall() {
    if (!backWallTransform.gameObject.activeSelf) {
      backWallTransform.gameObject.SetActive(true);
      yield return new WaitForSeconds(90f);
      backWallTransform.gameObject.SetActive(false);
    }
  }

  private IEnumerator BonuceTwiceBall() {
    if (twiceBallObj == null) {
      twiceBallObj = Instantiate(ballTransform.gameObject);
      Ball ball = new Ball(AddObjectId(), twiceBallObj.GetComponent<Collider>(), this);
      objectsList.Add(ball);
      yield return new WaitForSeconds(30f);
      Destroy(twiceBallObj);
      AddObjectToDelete(ball);
      twiceBallObj = null;
    }
  }

  // EVENTS ===================================================================

  public void PlaySound(string sound) {
    gameSoundController.PlaySound(sound);
  }

  private IEnumerator GrowBallSpeed() {
    while (true) {
      SharedData.Instance.SetBallSpeed(SharedData.Instance.ballSpeed + 0.01f);
      yield return new WaitForSeconds(0.1f);
    }
  }

  // COLLISION DETECT =========================================================

  public List<KeyValuePair<ITouchible, DirectType>> CheckCollision(int objectId, Bounds selfBounds) {
    List<KeyValuePair<ITouchible, DirectType>> collideList = new List<KeyValuePair<ITouchible, DirectType>>();
    for (int i = 0; i < objectsList.Count; i++)
      if (objectId != objectsList[i].GetObjectId()) {
        Bounds otherBounds = objectsList[i].GetObjectBounds();
        if (CheckIntersection(selfBounds, otherBounds)) {
          DirectType dir = GetDirectIntersection(selfBounds, otherBounds);
          collideList.Add(new KeyValuePair<ITouchible, DirectType>(objectsList[i], dir));
        }
      }
    for (int i = 0; i < cubesList.Count; i++)
      if (objectId != cubesList[i].GetObjectId()) {
        Bounds otherBounds = cubesList[i].GetObjectBounds();
        if (CheckIntersection(selfBounds, otherBounds)) {
          DirectType dir = GetDirectIntersection(selfBounds, otherBounds);
          collideList.Add(new KeyValuePair<ITouchible, DirectType>(cubesList[i], dir));
        }
      }
    return collideList;
  }

  private bool CheckIntersection(Bounds selfBounds, Bounds otherBounds) {
    if (selfBounds.max.x < otherBounds.min.x) return false;
    if (selfBounds.min.x > otherBounds.max.x) return false;
    if (selfBounds.max.z < otherBounds.min.z) return false;
    if (selfBounds.min.z > otherBounds.max.z) return false;
    return true;
  }

  private DirectType GetDirectIntersection(Bounds selfBounds, Bounds otherBounds) {
    bool isLeft  = selfBounds.max.x > otherBounds.max.x;
    bool isUp    = selfBounds.max.z < otherBounds.max.z;
    float maxX = Mathf.Min(selfBounds.max.x ,otherBounds.max.x);
    float minX = Mathf.Max(selfBounds.min.x ,otherBounds.min.x);
    float maxZ = Mathf.Min(selfBounds.max.z ,otherBounds.max.z);
    float minZ = Mathf.Max(selfBounds.min.z ,otherBounds.min.z);

    if (Mathf.Abs(maxX - minX) < Mathf.Abs(maxZ - minZ)) {
      if (isLeft) return DirectType.LEFT;
      else return DirectType.RIGHT;
    } else if (Mathf.Abs(maxX - minX) > Mathf.Abs(maxZ - minZ)) {
      if (isUp) return DirectType.UP;
      else return DirectType.DOWN;
    } else return DirectType.DIAG;
  }


}
