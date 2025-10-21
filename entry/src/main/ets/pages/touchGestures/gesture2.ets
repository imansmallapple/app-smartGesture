import { gestureInfoComponent } from '../../components/gestureInfo'
import { gestureTaskComponent } from '../../components/gestureTask'
import Touch from '../../models/model'

@Entry
@Component
struct PressHold {
  @State title: string = ''
  @State description: string = ''
  @State task: string = ''
  @State image: string = ''
  @State isOn: boolean = false
  @State progressValue: number = 0
  @State animationId: number | null = null

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

  build() {
    Column() {
      gestureInfoComponent({
        title: this.title,
        description: this.description
      })

      Column() {

        Progress({ value: this.progressValue, total: 100, type: ProgressType.Ring })
          .color(Color.Orange)
          .width(30)
          .style({ strokeWidth: 5, enableSmoothEffect: true })
          .backgroundColor('#2c070000')

        Image(this.isOn ? $r('app.media.blub_on') : $r('app.media.bulb_off'))
          .width(50)
      }
      .layoutWeight(1)

      gestureTaskComponent({
        task: this.task,
        image: this.image
      })
    }
    .gesture(
      LongPressGesture({ repeat: true, duration: 10 })
        .onAction((event: GestureEvent | undefined) => {
          if (event && this.progressValue <= 100) {
            clearInterval(this.animationId)
            this.animationId = null
            this.progressValue++
            if (this.progressValue == 100) {
              this.isOn = true
            }
          }
        })
        .onActionEnd(() => {
          if (this.progressValue <= 101) {
            this.progressValue = 0
            this.isOn = false
          }
        })
    )
    .backgroundColor('#e84699cf')
    .height('100%')
    .width('100%')
    .borderRadius('50%')
  }
}