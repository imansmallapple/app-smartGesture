import { gestureInfoComponent } from '../../components/gestureInfo'
import Constant from '../../common/constant'
import { KeyCode } from '@kit.InputKit'

@Entry
@Component
struct DoubleSlide {
  @State isBulb1On: boolean = false
  @State isBulb2On: boolean = false

  aboutToAppear() {
    this.getUIContext().getFocusController().activate(true, false)
  }

  onPageShow() {
    this.getUIContext().getFocusController().requestFocus('bulb1')
  }

  aboutToDisappear() {
    this.getUIContext().getFocusController().activate(false, true)
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.smartAbilityList[1].title,
        description: Constant.smartAbilityList[1].description
      })

      Row() {
        Row() {
          Column() {
            Text('LAST')
              .fontSize('15px')
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
          }
          .width('10%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Start)
          .backgroundColor(Color.Orange)
          .borderRadius({
            topRight: 15,
            bottomRight: 15
          })
          .onClick(() => {
            this.getUIContext().getRouter().pushUrl({
              url: 'pages/smartGestures/gesture1'
            })
          })

          Row() {
            Image(this.isBulb1On ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
              .width(50)
              .id('bulb1')
              .focusable(true)
              .onKeyEvent((event) => {
                if (event.keyCode == KeyCode.KEYCODE_ENTER && event.type == KeyType.Down) {
                  this.isBulb1On = !this.isBulb1On
                }
              })
              .onBlur(() => {
                this.getUIContext().getFocusController().requestFocus('bulb2')
              })

            Image(this.isBulb2On ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
              .width(50)
              .id('bulb2')
              .focusable(true)
              .onKeyEvent((event) => {
                if (event.keyCode == KeyCode.KEYCODE_ENTER && event.type == KeyType.Down) {
                  this.isBulb2On = !this.isBulb2On
                }
              })
              .onBlur(() => {
                this.getUIContext().getFocusController().requestFocus('bulb1')
              })
          }
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)

          Column() {
            Text('END')
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
              url: 'pages/Index'
            })
          })
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .layoutWeight(1)

      Column() {
        Text(Constant.smartAbilityList[1].task)
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