import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'

@Entry
@Component
struct DoubleTap {
  @State isOn: boolean = false
  @State scaleValue: number = 1;
  @State pinchValue: number = 1;
  @State pinchX: number = 10;
  @State pinchY: number = 10;

  onBackPress(): boolean | void {
    return true
  }

  triggerBulb() {
    if (this.scaleValue >= 4) {
      this.isOn = true
    } else {
      this.isOn = false
    }
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.gestureList[5].title,
        description: Constant.gestureList[5].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          isCrownGesture: false,
          currentTouchId: 6
        })

        Row({ space: 10 }) {
          Row() {
            Image($r('app.media.thunder'))
              .width(10)
              .scale({
                x: this.scaleValue,
                y: this.scaleValue,
                z: 1
              })
          }
          .width(30)
          .justifyContent(FlexAlign.Center)

          Image($r('app.media.right'))
            .width(40)

          Image(this.isOn ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
            .width(50)
        }
        .height('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        .gesture(
          PinchGesture({ fingers: 2, distance: 10 })
            .onActionUpdate((event: GestureEvent) => {
              if (event) {
                this.scaleValue = this.pinchValue * event.scale;
                this.pinchX = event.pinchCenterX;
                this.pinchY = event.pinchCenterY;
                this.triggerBulb()
              }
            })
            .onActionEnd(() => {
              this.pinchValue = this.scaleValue;
            })
        )

        buttonComponent({
          isNext: true,
          isCrownGesture: false,
          currentTouchId: 6
        })
      }
      .width('100%')
      .layoutWeight(1)


      gestureTaskComponent({
        task: Constant.gestureList[5].task,
        image: Constant.gestureList[5].image
      })
    }
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
  }
}
