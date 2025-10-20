// xxx.ets
import { ComponentContent, LengthMetrics } from '@kit.ArkUI';
import { UIContext, CircleShape } from '@kit.ArkUI';
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute } from '@kit.ArkUI';
import Constant from '../common/constant'
import Touch from '../models/model';

@Builder
function buildText() {
  Column() {
    Text("Gesture List")
      .fontSize('40px')
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.Black)
  }.margin({ top: 20 })
}

@Entry
@Component
struct Index {
  private touchGestureList: Touch[] = Constant.gestureList
  private watchSize: string = '466px'; // Wearable默认宽高：466*466
  private listSize: string = '414px'; // item宽度
  @State isTouchGesture: boolean = true
  context: UIContext = this.getUIContext();
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));

  private pageOf(isTouchGesture?: boolean, touchIndex?: number, crownIndex?: number): string {
    if (isTouchGesture) {
      return `pages/touchGestures/gesture${touchIndex}`
    }
    return `pages/crownGestures/gesture${crownIndex}`
  }

  @Builder
  buildList2() {
    Stack() {
      Column() {
      }
      .justifyContent(FlexAlign.Center)
      .width(this.watchSize)
      .height(this.watchSize)
      .clipShape(new CircleShape({ width: '100%', height: '100%' }))
      .backgroundColor(Color.White)

      ArcList({ initialIndex: 0, header: this.tabBar1 }) {
        ForEach(this.touchGestureList, (item: Touch, index: number) => {
          ArcListItem() {
            Button('' + item.title, { type: ButtonType.Capsule })
              .width(this.listSize)
              .height('100px')
              .fontSize('40px')
              .focusable(true)
              .focusOnTouch(true)
              .backgroundColor(0x17A98D)
          }.align(Alignment.Center)
          .onClick(() => {
            this.getUIContext().getRouter().pushUrl({
              url: this.pageOf(true, index + 1),
              params: {
                title: item.title,
                description: item.description,
                task: item.task,
                image: item.image
              }
            })
          })
        }, (item: number, index: number) => (item + index).toString())
      }
      .space(LengthMetrics.px(10))
      .borderRadius(this.watchSize)
      .focusable(true)
      .focusOnTouch(true)
      .defaultFocus(true)
    }
    .align(Alignment.Center)
    .width(this.watchSize)
    .height(this.watchSize)
    .border({ color: Color.Black, width: 1 })
    .borderRadius(this.watchSize)
  }

  build() {
    Column() {
      this.buildList2()
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}