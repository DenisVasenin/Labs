using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Cube : ITouchible {

  private CubeType cubeType;


  public Cube(int id, Color color, Collider collider, GameController gController) {
    Init(id, collider, gController);
    SetCubeType(color);
    objectType = ObjectType.CUBE;
  }

  // OVERRIDE =================================================================

  public override void Update() {
    CheckCollision();
  }

  // public override void Reset() {
  //   selfTransform.gameObject.SetActive(false);
  //   selfTransform.Translate(startPos - selfTransform.position);
  // }

  // ==========================================================================

  private void SetCubeType(Color color) {
    if (color == Color.red) cubeType = CubeType.BALL;
    else if (color == Color.yellow) cubeType = CubeType.WALL;
    else if (color == Color.green) cubeType = CubeType.HEALTH;
    else if (color == Color.cyan) cubeType = CubeType.SCORE;
  }

  // COLLISION ================================================================

  private void CheckCollision() {
    List<KeyValuePair<ITouchible, DirectType>> collideList = gameController.CheckCollision(objectId, selfCollider.bounds);
    for (int i = 0; i < collideList.Count; i++) {
      if (collideList[i].Key.GetObjectType() == ObjectType.BALL) {
        gameController.EnableBonuse(cubeType, selfTransform);
        gameController.AddObjectToDelete(this);
      }
    }
  }


}
