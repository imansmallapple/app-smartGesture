import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'

@Entry
@Component
struct Tap {
  @State isOn: boolean = false
  @State angle: number = 0
  @State rotateValue: number = 0

  triggerBulb() {
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.gestureList[7].title,
        description: Constant.gestureList[7].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          currentTouchId: 8
        })

        Row({ space: 10 }) {
          Column() {
            Image($r('app.media.cloud'))
              .width(30)
            if (this.isOn) {
              Image($r('app.media.thunder'))
                .width(30)
                .rotate({ angle: 180 })
            }
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

      }
      .width('100%')
      .layoutWeight(1)


      gestureTaskComponent({
        task: Constant.gestureList[7].task,
        image: Constant.gestureList[7].image
      })
    }
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
    .gesture(
      TapGesture({ count: 1 })
        .onAction((event: GestureEvent) => {
          if (event) {
            this.isOn = true
          }
        })
    )
  }
}
