using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Ball : ITouchible {

  private System.Random rnd = new System.Random();
  private float angle = 0;

  public Ball(int id, Collider collider, GameController gController) {
    Init(id, collider, gController);
    objectType = ObjectType.BALL;
    angle = ConvertAngle(GetRandomAngle(30, 150));
  }

  // OVERRIDE =================================================================

  public override void Update() {
    Move();
    CheckCollision();
  }

  public override void Reset() {
    angle = ConvertAngle(GetRandomAngle(30, 150));
    selfTransform.Translate(startPos - selfTransform.position);
  }

  // MOVE =====================================================================

  protected override void Move() {
    Vector3 localPos = new Vector3(SharedData.Instance.ballSpeed * Mathf.Sin(angle * Mathf.Deg2Rad), 0, SharedData.Instance.ballSpeed * Mathf.Cos(angle * Mathf.Deg2Rad));
    selfTransform.Translate(localPos * Time.deltaTime);
  }

  // ANGLE ====================================================================

  private float GetRandomAngle(int start, int stop) {
    return (float)rnd.Next(start, stop);
  }

  private float ConvertAngle(float angle) {
    return ClampAngle(angle - 90);
  }

  private float ClampAngle(float angle) {
    if (angle < 180) angle += 360.0f;
    else if (angle > 180.0f) angle -= 360.0f;
    return angle;
  }

  private float MirrorByX(float angle) {
    return -angle;
  }

  private float MirrorByZ(float angle) {
    if (angle < 0) return -180.0f - angle;
    else return 180 - angle;
  }

  // COLLISION ================================================================

  private void CheckCollision() {
    bool isCubeCollide = false;
    List<KeyValuePair<ITouchible, DirectType>> collideList = gameController.CheckCollision(objectId, selfCollider.bounds);
    foreach (KeyValuePair<ITouchible, DirectType> pair in collideList) {
      if (pair.Key.GetObjectType() == ObjectType.BORDER) {
        BoardCollide(pair.Value);
      }
      if (pair.Key.GetObjectType() == ObjectType.PLAYER) {
        PlayerCollide(pair.Value);
      }
      if (pair.Key.GetObjectType() == ObjectType.FAILLINE) {
        FailLineCollide();
      }
      if (pair.Key.GetObjectType() == ObjectType.CUBE && !isCubeCollide) {
        isCubeCollide = true;
        CubeCollide(pair.Value);
      }
    }
  }

  private void BoardCollide(DirectType direct) {
    if (direct == DirectType.LEFT || direct == DirectType.RIGHT) {
      angle = MirrorByX(angle);
    } else if (direct == DirectType.UP || direct == DirectType.DOWN) {
      angle = MirrorByZ(angle);
    } else {
      angle = MirrorByX(angle);
      angle = MirrorByZ(angle);
    }
    gameController.PlaySound("ballCollideBorder");
  }

  private void PlayerCollide(DirectType direct) {
    if (direct == DirectType.LEFT || direct == DirectType.RIGHT) {
      angle = MirrorByX(angle);
    } else {
      angle = MirrorByZ(angle);
      if (SharedData.Instance.isLeft) {
        if (angle < 0) angle -= GetRandomAngle(2, 5);
        else angle -= GetRandomAngle(2, 5);
      }
      if (SharedData.Instance.isRight) {
        if (angle < 0) angle += GetRandomAngle(2, 5);
        else angle += GetRandomAngle(2, 5);
      }
    }
    gameController.PlaySound("ballCollidePlayer");
  }

  private void CubeCollide(DirectType direct) {
    if (direct == DirectType.LEFT || direct == DirectType.RIGHT) {
      angle = MirrorByX(angle);
    } else if (direct == DirectType.UP || direct == DirectType.DOWN) {
      angle = MirrorByZ(angle);
    } else {
      angle = MirrorByX(angle);
      angle = MirrorByZ(angle);
    }
  }

  private void FailLineCollide() {
    gameController.PlaySound("ballCollideFailLine");
    gameController.StopRound(RoundState.FAIL);
  }


}
