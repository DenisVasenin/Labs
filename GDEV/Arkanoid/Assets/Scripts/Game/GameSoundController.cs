using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class GameSoundController : MonoBehaviour {

  private AudioSource audioSource = null;

  [SerializeField] private AudioClip ballCollideBorder = null;
  [SerializeField] private AudioClip ballCollidePlayer = null;
  [SerializeField] private AudioClip ballCollideFailLine = null;
  [SerializeField] private AudioClip collideScoreCube = null;
  [SerializeField] private AudioClip collideOtherCube = null;

  void Start () {
    audioSource = GetComponent<AudioSource>();
  }

  // ======================================================

  public void PlaySound(string sound) {
    if (sound == "ballCollideBorder") {
      audioSource.clip = ballCollideBorder;
    }
    if (sound == "ballCollidePlayer") {
      audioSource.clip = ballCollidePlayer;
    }
    if (sound == "ballCollideFailLine") {
      audioSource.clip = ballCollideFailLine;
    }
    if (sound == "collideScoreCube") {
      audioSource.clip = collideScoreCube;
    }
    if (sound == "collideOtherCube") {
      audioSource.clip = collideOtherCube;
    }
    audioSource.Play();
  }


}
