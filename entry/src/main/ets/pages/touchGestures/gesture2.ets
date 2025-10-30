import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'
import Touch from '../../models/model'

@Entry
@Component
struct PressHold {
  @State isOn: boolean = false
  @State progressValue: number = 0
  @State animationId: number | null = null

  onBackPress(): boolean | void {
    return true
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.gestureList[1].title,
        description: Constant.gestureList[1].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          isCrownGesture: false,
          currentTouchId: 2
        })

        Column() {

          Progress({ value: this.progressValue, total: 100, type: ProgressType.Ring })
            .color(Color.Orange)
            .width(30)
            .style({ strokeWidth: 5, enableSmoothEffect: true })
            .backgroundColor('#2c070000')

          Image(this.isOn ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
            .width(50)
        }
        .layoutWeight(1)
        .gesture(
          LongPressGesture({ repeat: true, duration: 10 })
            .onAction((event: GestureEvent | undefined) => {
              if (event && this.progressValue <= 100) {
                clearInterval(this.animationId)
                this.animationId = null
                this.progressValue++
                if (this.progressValue == 100) {
                  this.isOn = true
                }
              }
            })
            .onActionEnd(() => {
              if (this.progressValue <= 101) {
                this.progressValue = 0
                this.isOn = false
              }
            })
        )

        buttonComponent({
          isNext: true,
          isCrownGesture: false,
          currentTouchId: 2
        })
      }
      .width('100%')
      .layoutWeight(1)

      gestureTaskComponent({
        task: Constant.gestureList[1].task,
        image: Constant.gestureList[1].image
      })
    }

    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
  }
}