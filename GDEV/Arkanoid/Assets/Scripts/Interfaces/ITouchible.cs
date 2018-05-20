using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public abstract class ITouchible {

  protected GameController gameController = null;
  protected int objectId;
  protected ObjectType objectType;
  protected Collider selfCollider;
  protected Transform selfTransform;
  protected Vector3 startPos;

  protected void Init(int id, Collider collider, GameController gController) {
    objectId = id;
    selfCollider = collider;
    selfTransform = selfCollider.transform;
    startPos = selfTransform.position;
    gameController = gController;
  }

  public virtual void Update() {}

  public virtual void Reset() {}

  protected virtual void Move() {}

  public int GetObjectId() {
    return objectId;
  }

  public ObjectType GetObjectType() {
    return objectType;
  }

  public Bounds GetObjectBounds() {
    return selfCollider.bounds;
  }

}
