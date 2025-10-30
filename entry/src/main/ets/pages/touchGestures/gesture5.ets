import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'

@Entry
@Component
struct DoubleTap {
  @State isOn: boolean = false

  onBackPress(): boolean | void {
    return true
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.gestureList[4].title,
        description: Constant.gestureList[4].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          isCrownGesture: false,
          currentTouchId: 5
        })

        Row({ space: 10 }) {
          Row() {
            Image($r('app.media.thunder'))
              .width(this.isOn ? 30 : 10)
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
          TapGesture({ count: 2 })
            .onAction((event: GestureEvent) => {
              if (event) {
                this.isOn = !this.isOn
              }
            })
        )

        buttonComponent({
          isNext: true,
          isCrownGesture: false,
          currentTouchId: 5
        })
      }
      .width('100%')
      .layoutWeight(1)


      gestureTaskComponent({
        task: Constant.gestureList[4].task,
        image: Constant.gestureList[4].image
      })
    }
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
  }
}
