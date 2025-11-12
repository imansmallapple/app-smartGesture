import { gestureInfoComponent } from '../../components/gestureInfo'
import Constant from '../../common/constant'
import { KeyCode } from '@kit.InputKit'

@Entry
@Component
struct DoubleTap {
  @State isOn: boolean = false

  aboutToAppear() {
    this.getUIContext().getFocusController().activate(true, false)
  }

  onPageShow() {
    this.getUIContext().getFocusController().requestFocus('bulb')
  }

  aboutToDisappear() {
    this.getUIContext().getFocusController().activate(false, true)
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.smartAbilityList[0].title,
        description: Constant.smartAbilityList[0].description
      })

      Row() {
        Row() {
          Image($r('app.media.double_pinch'))
            .borderRadius(20)
            .width(40)
            .onClick(() => {
              this.getUIContext().getFocusController().requestFocus('bulb')
            })

          Image(this.isOn ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
            .width(50)
            .id('bulb')
            .focusable(true)
            .onKeyEvent((event) => {
              if (event.keyCode == KeyCode.KEYCODE_ENTER && event.type == KeyType.Down) {
                this.isOn = !this.isOn
              }
            })
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        .margin({ left: 20 })

        Column() {
          Text('NEXT')
            .fontSize('15px')
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
            .margin({ left: 3 })
        }
        .width('10%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Start)
        .backgroundColor(Color.Orange)
        .borderRadius({
          topLeft: 15,
          bottomLeft: 15
        })
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/smartGestures/gesture2'
          })
        })
      }
      .width('100%')
      .layoutWeight(1)

      Column() {
        Text(Constant.smartAbilityList[0].task)
          .fontSize('20px')
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
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