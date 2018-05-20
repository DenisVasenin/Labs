using UnityEngine;
using UnityEngine.UI;


public class CellController : MonoBehaviour {

  [SerializeField] private BoardController boardController;
  [SerializeField] private Sprite emptySprite;
  [SerializeField] private Sprite crossSprite;
  [SerializeField] private Sprite zeroSprite;
  private Image image;
  private int cellNumber;
  private PlayerSide cellState;

  void Awake () {
    cellState = PlayerSide.NONE;
    image = this.transform.GetComponent<Image>();
  }

  public PlayerSide GetCellState() {
    return cellState;
  }

  public void SetCellNumber(int num) {
    cellNumber = num;
  }

  public void SetCellState(PlayerSide state) {
    cellState = state;
    if (state == PlayerSide.X) image.sprite = crossSprite;
    else if (state == PlayerSide.O) image.sprite = zeroSprite;
    else image.sprite = emptySprite;
  }

  public void OnClickCell() {
    boardController.OnClickCell(cellNumber);
  }


}
