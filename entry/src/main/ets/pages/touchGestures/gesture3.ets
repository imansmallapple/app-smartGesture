import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import Touch from '../../models/model'

@Entry
@Component
struct DragDrop {
  @State title: string = ''
  @State description: string = ''
  @State task: string = ''
  @State image: string = ''
  @State isOn: boolean = false
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State positionX: number = 0;
  @State positionY: number = 0;

  onPageShow(): void {
    const params = this.getUIContext().getRouter().getParams() as Touch
    try {
      if (params) {
        this.title = params.title
        this.description = params.description
        this.task = params.task
        this.image = params.image
      }
    } catch (error) {
      console.error('Error: ', error);
    }
  }

  triggerBulb() {
    if (this.offsetX >= 15 && this.offsetX <= 67 && this.offsetY >= -40 && this.offsetY <= 40) {
      this.isOn = true
    } else {
      this.isOn = false
    }
  }

  build() {
    Column() {
      gestureInfoComponent({
        title: this.title,
        description: this.description
      })

      Row() {

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

      gestureTaskComponent({
        task: this.task,
        image: this.image
      })
    }
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
  }
}
