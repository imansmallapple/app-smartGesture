@Entry
@Component
struct Index {
  onBackPress(): boolean | void {
    return true
  }

  build() {
    Stack() {

      Button("Smart Gestures")
        .zIndex(1)
        .backgroundColor(Color.Orange)
        .fontColor('#ff4d2c5a')
        .fontWeight(FontWeight.Bold)
        .fontSize(16)
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/smart',
          })
        })

      Column() {
        Row() {
          Text("Screen Gestures")
            .fontWeight(FontWeight.Bold)
        }
        .height('50%')
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#fa000000')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/screen',
          })
        })

        Row() {
          Text("Crown Gestures")
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Bold)
        }
        .height('50%')
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.White)
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/crown',

          })
        })

      }
      .width('100%')
      .height('100%')
    }
  }
}