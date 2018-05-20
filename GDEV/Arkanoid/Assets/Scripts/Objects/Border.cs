using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Border : ITouchible {

  public Border(int id, Collider collider, GameController gController) {
    objectType = ObjectType.BORDER;
    Init(id, collider, gController);
  }

}
