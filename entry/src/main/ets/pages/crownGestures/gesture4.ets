import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'

@Entry
@Component
struct Rotate {
  @State isOn: boolean = false
  private fruitList: string[] = Constant.fruitList
  private listScroller: Scroller = new Scroller()
  @State angle: number = 0
  @State message: string = 'test'

  onBackPress(): boolean | void {
    return true
  }

  triggerBulb() {
    if (Math.abs(this.angle) >= 30) {
      this.isOn = true
    } else {
      this.isOn = false
    }
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.crownAbilityList[3].title,
        description: Constant.crownAbilityList[3].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          isCrownGesture: true,
          currentTouchId: 4
        })

        Row({ space: 10 }) {

          Column() {
            Image($r('app.media.thunder'))
              .width(10 + Math.abs(this.angle))
          }
          .margin({
            top: 10
          })
          .width(50)
          .height('100%')
          .justifyContent(FlexAlign.Center)

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
          isCrownGesture: true,
          currentTouchId: 4
        })
      }
      .width('100%')
      .layoutWeight(1)

      gestureTaskComponent({
        task: Constant.crownAbilityList[3].task,
        image: Constant.crownAbilityList[3].image
      })
    }
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
    .onDigitalCrown((event: CrownEvent) => {
      event.stopPropagation();
      this.message = "CrownEvent\n\n" + JSON.stringify(event);
      console.log('event degree:', event.degree)
      this.angle = event.degree
      this.triggerBulb()
    })
  }
}
