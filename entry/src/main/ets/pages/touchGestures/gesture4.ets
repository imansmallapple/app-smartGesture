import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'

@Entry
@Component
struct Swipe {
  @State isOn: boolean = false
  private fruitList: string[] = Constant.fruitList
  private listScroller: Scroller = new Scroller()
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  private _panStartY: number = 0
  private _startScrollY: number = 0
  private _currentScrollY: number = 0
  private _maxScrollY: number = 0

  onBackPress(): boolean | void {
    return true
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
        title: Constant.gestureList[3].title,
        description: Constant.gestureList[3].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          isCrownGesture: false,
          currentTouchId: 4
        })

        Row({ space: 10 }) {

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

          Image($r('app.media.right'))
            .width(50)
            .margin({ top: 10 })

          Image(this.isOn ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
            .width(50)
        }
        .width('80%')
        .justifyContent(FlexAlign.Center)

        buttonComponent({
          isNext: true,
          isCrownGesture: false,
          currentTouchId: 4
        })
      }
      .width('100%')
      .layoutWeight(1)

      gestureTaskComponent({
        task: Constant.gestureList[3].task,
        image: Constant.gestureList[3].image
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
