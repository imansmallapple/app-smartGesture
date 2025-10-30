@Component
export struct gestureInfoComponent {
  @Prop title: string;
  @Prop description: string;

  // @Prop task: string;

  build() {
    Column({ space: 20 }) {
      Row() {
        Text(this.title)
          .fontSize('25px')
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
          .margin({ top: 10 })
      }
      .margin({ top: 10 })

      Row() {
        Text(this.description)
          .fontSize('20px')
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
      }
      .padding({ left: 22, right: 22 })
    }
    .backgroundColor(Color.White)
    .height('35%')
    .width('100%')
    .borderRadius({
      topLeft: "50%",
      topRight: "50%"
    })
  }
}

