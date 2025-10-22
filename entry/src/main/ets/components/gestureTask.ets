@Component
export struct gestureTaskComponent {
  // @Prop title: string;
  // @Prop description: string;
  @Prop task: string;
  @Prop image: string;

  build() {
    Stack() {
      Row() {
        Row() {
          Image($r(this.image))
            .height(55)
            .width(60)
        }
        .margin({ left: 30 })

        Row() {
          Text(this.task)
            .fontSize('18px')
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Black)
            .margin({ right: 35 })
        }
        .width('50%')
        .height('100%')
      }
      .height('50%')
    }
    .backgroundColor(Color.White)
    .height('25%')
    .width('100%')
    .borderRadius({
      bottomLeft: "50%",
      bottomRight: "50%"
    })
  }
}

