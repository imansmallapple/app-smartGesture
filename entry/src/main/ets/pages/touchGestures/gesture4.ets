import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import Touch from '../../models/model'

@Entry
@Component
struct Swipe {
  @State title: string = ''
  @State description: string = ''
  @State task: string = ''
  @State image: string = ''
  @State isOn: boolean = false
  private fruitList: string[] = Constant.fruitList
  private listScroller: Scroller = new Scroller()
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  private _panStartY: number = 0
  private _startScrollY: number = 0
  private _currentScrollY: number = 0
  private _maxScrollY: number = 0

  onPageShow(): void {
    const params = this.getUIContext().getRouter().getParams() as Touch
    try {
      if (params) {
        this.title = params.title
        this.description = params.description
        this.task = params.task
        this.image = params.image
      }
    } catch (error) {
      console.error('Error: ', error);
    }
    this._panStartY = 0
    this._startScrollY = 0
    this._currentScrollY = 0
    this._maxScrollY = 0
  }

  triggerBulb() {
    if (this._currentScrollY >= 113 && this._currentScrollY <= 123) {
      this.isOn = true
    } else {
      this.isOn = false
    }
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: this.title,
        description: this.description
      })

      Row({ space: 30 }) {

        Stack() {

          Column() {
            List({ initialIndex: 0, scroller: this.listScroller }) {
              ForEach(this.fruitList, (item: string) => {
                ListItem() {
                  Column() {
                    Image($r(item))
                      .width(30)
                  }
                  .width('100%')
                  .alignItems(HorizontalAlign.Center)
                }
              })
            }
            .enableScrollInteraction(false)
          }
          .width(50)
          .height('90%')
          .borderWidth(2)
          .borderRadius(10)
          .borderColor(Color.Pink)
          .zIndex(1)
          .backgroundColor('#ff4699cf')

          Image($r('app.media.frame'))
            .width(50)
            .zIndex(2)
            .margin({
              top: 10
            })
        }

        Image(this.isOn ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
          .width(50)
      }
      .layoutWeight(1)

      gestureTaskComponent({
        task: this.task,
        image: this.image
      })
    }
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
    .gesture(
      PanGesture()
        .onActionStart((event) => {
          const startY: number =
            (event && event.offsetY !== undefined) ? event.offsetY : (event && event.offsetY) ? event.offsetY : 0;
          this._panStartY = startY;
          this._startScrollY = this._currentScrollY || 0;

          console.info('Pan start: startY=', this._panStartY, 'startScrollY=', this._startScrollY);
        })
        .onActionUpdate((event) => {
          if (!event) {
            return;
          }

          const curY: number = (event.offsetY !== undefined) ? event.offsetY : (event.offsetY || 0);
          const delta = this._panStartY - curY;

          let newScroll = this._startScrollY + delta;

          if (newScroll < 0) {
            newScroll = 0;
          }
          if (this._maxScrollY && newScroll > this._maxScrollY) {
            newScroll = this._maxScrollY;
          }

          this._currentScrollY = Math.round(newScroll);
          try {
            this.listScroller.scrollTo({
              xOffset: 0,
              yOffset: this._currentScrollY
            });
            this.triggerBulb()
            console.log('coordindates: ', this._currentScrollY)
          } catch (err) {
            console.warn('scrollTo error', err);
          }
        })
        .onActionEnd((event) => {
          console.info('Pan end, final scrollY=', this._currentScrollY);
        })
    )
  }
}
