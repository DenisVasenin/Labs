using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cell {

  private Animation cellAnimation = null;
  private SpriteRenderer cellSpriteRenderer = null;
  private Dictionary<string, Sprite> spritesAtlas = new Dictionary<string, Sprite>();

  private int cellId = 0;
  private int cellValue = 0;


  public Cell(int id, Transform transform, Dictionary<string, Sprite> atlas) {
    cellId = id;
    cellAnimation = transform.GetComponent<Animation>();
    cellSpriteRenderer = transform.GetComponent<SpriteRenderer>();
    spritesAtlas = atlas;
  }


  public void ResetCell() {
    cellAnimation.Stop();
    SetCellValue(0);
  }

  public int GetCellId() {
    return cellId;
  }

  public int GetCellValue() {
    return cellValue;
  }

  public void SetCellValue(int value) {
    cellValue = value;
    cellSpriteRenderer.sprite = spritesAtlas[value.ToString()];
  }

  public void PlayCellAnimation() {
    cellAnimation.Play();
  }


}
