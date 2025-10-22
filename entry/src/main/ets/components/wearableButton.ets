@Component
export struct buttonComponent {
  private lastUrl: string = '<'
  private nextUrl: string = '>'
  @Prop isNext: boolean
  @Prop currentTouchId: number

  build() {
    Column() {
      Text(this.isNext ? this.nextUrl : this.lastUrl)
        .fontSize('50px')
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .margin(this.isNext ? { left: 2 } : { right: 2 })
    }
    .onClick(() => {
      this.isNext ?
      this.getUIContext().getRouter().replaceUrl({
        url: `pages/touchGestures/gesture${this.currentTouchId + 1}`
      })
        :
      this.getUIContext().getRouter().replaceUrl({
        url: `pages/touchGestures/gesture${this.currentTouchId - 1}`
      })

    })
    .width('10%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(this.isNext ? HorizontalAlign.End : HorizontalAlign.Start)
    .backgroundColor(Color.Orange)
    .borderRadius(
      this.isNext ?
        {
          topLeft: 15,
          bottomLeft: 15
        }
        :
        {
          topRight: 15,
          bottomRight: 15
        }
    )
  }
}

