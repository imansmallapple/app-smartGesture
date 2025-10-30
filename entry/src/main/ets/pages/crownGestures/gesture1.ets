import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'
import Constant from '../../common/constant'

@Entry
@Component
struct Press {

  onBackPress(): boolean | void {
    return true
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.crownAbilityList[0].title,
        description: Constant.crownAbilityList[0].description
      })

      Row() {
        Row() {

          List({ space: 4 }) {
            ForEach(Constant.pressAbility, (item: string) => {
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

        buttonComponent({
          isNext: true,
          isCrownGesture: true,
          currentTouchId: 1,
        })
      }
      .width('100%')
      .layoutWeight(1)

      Column() {
        Image($r('app.media.app_gallery'))
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