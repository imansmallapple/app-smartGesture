// xxx.ets
import { ComponentContent, LengthMetrics } from '@kit.ArkUI';
import { UIContext, CircleShape } from '@kit.ArkUI';
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute } from '@kit.ArkUI';
import Constant from '../common/constant';
import Gesture from '../models/model';

@Builder
function buildCrownGestureTitle() {
  Column() {
    Text("Crown Gestures")
      .fontSize('40px')
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.Black)
  }.margin({ top: 20 })
}

interface ListType {
  isScreenGesture: boolean
}

@Entry
@Component
struct CrownGestureList {
  private gestureList: Gesture[] = Constant.crownAbilityList
  private watchSize: string = '466px'
  private listSize: string = '414px'
  @State isTouchGesture: boolean = true
  context: UIContext = this.getUIContext();
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context,
    wrapBuilder(buildCrownGestureTitle));

  private pageOf(crownIndex?: number): string {
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
        ForEach(this.gestureList, (item: Gesture, index: number) => {
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
              url: this.pageOf(index + 1)
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