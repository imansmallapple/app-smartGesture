import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'
import Constant from '../../common/constant'

@Entry
@Component
struct TouchPage {
  @State isOn: boolean = false

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.gestureList[0].title,
        description: Constant.gestureList[0].description
      })

      Row() {
        Row({ space: 20 }) {

          // Toggle({ type: ToggleType.Switch, isOn: this.isOn })
          Image($r('app.media.finger_print'))
            .onTouch(() => {
              this.isOn = true
            })
            .borderRadius(20)
            .width(40)


          Image(this.isOn ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
            .width(50)

        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        .margin({ left: 20 })

        buttonComponent({
          isNext: true,
          currentTouchId: 1,
        })
      }
      .width('100%')
      .layoutWeight(1)

      gestureTaskComponent({
        task: Constant.gestureList[0].task,
        image: Constant.gestureList[0].image
      })
    }
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
  }
}