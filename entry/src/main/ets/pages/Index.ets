@Entry
@Component
struct Index {
  build() {
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