using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Player : ITouchible {

  private bool isLeft = false, isRight = false;
  private bool stopLeft = false, stopRight = false;

  public Player(int id, Collider collider, GameController gController) {
    objectType = ObjectType.PLAYER;
    Init(id, collider, gController);
  }

  // OVERRIDE =================================================================

  public override void Update() {
    Move();
    CheckCollision();
  }

  public override void Reset() {
    selfTransform.Translate(startPos - selfTransform.position);
  }

  // MOVE =====================================================================

  protected override void Move() {
    isLeft = SharedData.Instance.isLeft;
    isRight = SharedData.Instance.isRight;
    if (isLeft != isRight) {
      if (isLeft && !stopLeft) selfTransform.Translate(-SharedData.Instance.playerSpeed * Time.deltaTime, 0, 0);
      if (isRight && !stopRight) selfTransform.Translate(SharedData.Instance.playerSpeed * Time.deltaTime, 0, 0);
    }
  }

  // COLLISION ================================================================

  private void CheckCollision() {
    stopLeft = false;
    stopRight = false;
    List<KeyValuePair<ITouchible, DirectType>> collideList = gameController.CheckCollision(objectId, selfCollider.bounds);
    foreach (KeyValuePair<ITouchible, DirectType> pair in collideList) {
      if (pair.Key.GetObjectType() == ObjectType.BORDER) {
        if (pair.Value == DirectType.LEFT) stopLeft = true;
        if (pair.Value == DirectType.RIGHT) stopRight = true;
      }
    }
  }


}
