import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'
import Touch from '../../models/model'

@Entry
@Component
struct PressHold {

  onBackPress(): boolean | void {
    return true
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.crownAbilityList[1].title,
        description: Constant.crownAbilityList[1].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          isCrownGesture: true,
          currentTouchId: 2
        })

        Row() {
          Row() {

            List({ space: 4 }) {
              ForEach(Constant.pressHoldAbility, (item: string) => {
                ListItem() {
                  Text(item)
                    .fontSize(10)
                    .fontWeight(FontWeight.Bold)
                }
              })
            }
          }
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .margin({ left: 20 })
        }
        .width('100%')
        .layoutWeight(1)

        buttonComponent({
          isNext: true,
          isCrownGesture: true,
          currentTouchId: 2
        })
      }
      .width('100%')
      .layoutWeight(1)

      Column() {
        Image($r('app.media.shutdown'))
          .width(55)
      }
      .width('100%')
      .height('25%')
      .backgroundColor(Color.White)
      .justifyContent(FlexAlign.Center)
    }

    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
  }
}