import Constant from '../../common/constant'
import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import { buttonComponent } from '../../components/wearableButton'

@Entry
@Component
struct DragDrop {
  @State isOn: boolean = false
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State positionX: number = 0;
  @State positionY: number = 0;

  onBackPress(): boolean | void {
    return true
  }

  triggerBulb() {
    if (this.offsetX >= 67 && this.offsetX <= 93 && this.offsetY >= -40 && this.offsetY <= 40) {
      this.isOn = true
    } else {
      this.isOn = false
    }
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: Constant.gestureList[2].title,
        description: Constant.gestureList[2].description
      })

      Row() {
        buttonComponent({
          isNext: false,
          isCrownGesture: false,
          currentTouchId: 3
        })

        Row({ space: 50 }) {

          Image($r('app.media.thunder'))
            .width(30)
            .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
            .gesture(
              PanGesture()
                .onActionUpdate((event: GestureEvent | undefined) => {
                  if (event) {
                    this.offsetX = this.positionX + event.offsetX;
                    this.offsetY = this.positionY + event.offsetY;
                    this.triggerBulb()
                    console.log('coordinates: ', this.offsetX, this.offsetY)
                  }
                })
                .onActionEnd(() => {
                  this.positionX = this.offsetX;
                  this.positionY = this.offsetY;
                })
            )
            .zIndex(1)

          Image(this.isOn ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
            .width(50)
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)

        buttonComponent({
          isNext: true,
          isCrownGesture: false,
          currentTouchId: 3
        })
      }
      .width('100%')
      .layoutWeight(1)


      gestureTaskComponent({
        task: Constant.gestureList[2].task,
        image: Constant.gestureList[2].image
      })
    }
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
  }
}
