import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'

@Entry
@Component
struct Rotate {
  @State isOn: boolean = false
  @State angle: number = 0
  @State rotateValue: number = 0

  onBackPress(): boolean | void {
    return true
  }

  triggerBulb() {
    let n: number = Math.floor(this.angle / 360)

    if (this.angle >= (60 + 360 * n) && this.angle <= (120 + 360 * n)) {
      this.isOn = true
    } else {
      this.isOn = false
    }
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.gestureList[6].title,
        description: Constant.gestureList[6].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          isCrownGesture: false,
          currentTouchId: 7
        })

        Row({ space: 10 }) {
          Column() {
            Image($r('app.media.thunder'))
              .width(30)
          }
          .width(30)
          .justifyContent(FlexAlign.Center)

          Image($r('app.media.top'))
            .width(40)
            .rotate({ angle: this.angle })

          Image(this.isOn ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
            .width(50)
        }
        .height('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)

        buttonComponent({
          isNext: true,
          isCrownGesture: false,
          currentTouchId: 7
        })
      }
      .width('100%')
      .layoutWeight(1)


      gestureTaskComponent({
        task: Constant.gestureList[6].task,
        image: Constant.gestureList[6].image
      })
    }
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
    .gesture(
      RotationGesture()
        .onActionStart((event: GestureEvent | undefined) => {
          console.info('RotationGesture is onActionStart');
        })
        .onActionUpdate((event: GestureEvent | undefined) => {
          if (event) {
            this.angle = this.rotateValue + event.angle;
            this.triggerBulb()
          }
          console.info('RotationGesture is onActionUpdate', this.angle, this.rotateValue);
        })
        .onActionEnd(() => {
          this.rotateValue = this.angle;
          console.info('RotationGesture is onActionEnd');
        })
        .onActionCancel(() => {
          console.info('RotationGesture is onActionCancel');
        })
    )
  }
}
