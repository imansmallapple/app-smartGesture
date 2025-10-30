import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'

@Entry
@Component
struct DoublePress {

  onBackPress(): boolean | void {
    return true
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.crownAbilityList[2].title,
        description: Constant.crownAbilityList[2].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          isCrownGesture: true,
          currentTouchId: 3
        })

        Row() {
          Row() {

            List({ space: 4 }) {
              ForEach(Constant.doublePressAbility, (item: string) => {
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
          currentTouchId: 3
        })
      }
      .width('100%')
      .layoutWeight(1)

      Column() {
        Image($r('app.media.double_press'))
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
