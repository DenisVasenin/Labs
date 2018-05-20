using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InputController : MonoBehaviour {

  private SwipeState swipeState = SwipeState.NONE;
  private bool isSwipeStateChanged = false;
  private Vector3 firstTouchPos = Vector3.zero; //First touch position
  private Vector3 lastTouchPos = Vector3.zero; //Last touch position
  private float dragDistance; //minimum distance for a swipe to be registered


  void Start () {
    dragDistance = Screen.height * 5 / 100;
  }

  void Update () {
    if (Input.touchCount == 1) {
      Touch touch = Input.GetTouch(0);
      if (touch.phase == TouchPhase.Began) {
        firstTouchPos = touch.position;
        lastTouchPos = touch.position;
      }
      if (touch.phase == TouchPhase.Moved) {
        lastTouchPos = touch.position;
      }
      if (touch.phase == TouchPhase.Ended) {
        lastTouchPos = touch.position;
        if (IsSwipe()) {
          swipeState = GetSwipeDirect();
          isSwipeStateChanged = true;
        }
      }
    } else {
      if (isSwipeStateChanged) {
        ResetSwipeState();
        isSwipeStateChanged = false;
      }
    }
  }


  public SwipeState GetSwipeState() {
    return swipeState;
  }

  private bool IsSwipe() {
    return Mathf.Abs(lastTouchPos.x - firstTouchPos.x) > dragDistance || Mathf.Abs(lastTouchPos.y - firstTouchPos.y) > dragDistance;
  }

  private SwipeState GetSwipeDirect() {
    if (Mathf.Abs(lastTouchPos.x - firstTouchPos.x) > Mathf.Abs(lastTouchPos.y - firstTouchPos.y)) {
      if ((lastTouchPos.x > firstTouchPos.x)) {
        return SwipeState.RIGHT;
      }
      return SwipeState.LEFT;
    } else {
      if (lastTouchPos.y > firstTouchPos.y) {
        return SwipeState.UP;
      }
      return SwipeState.DOWN;
    }
  }

  private void ResetSwipeState() {
    swipeState = SwipeState.NONE;
    firstTouchPos = Vector3.zero;
    lastTouchPos = Vector3.zero;
  }


}
