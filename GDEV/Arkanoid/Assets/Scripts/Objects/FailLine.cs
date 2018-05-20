using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class FailLine : ITouchible {

  public FailLine(int id, Collider collider, GameController gController) {
    objectType = ObjectType.FAILLINE;
    Init(id, collider, gController);
  }


}
