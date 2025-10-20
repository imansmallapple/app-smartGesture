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

      }
      .layoutWeight(1)

      gestureTaskComponent({
        task: this.task,
        image: this.image
      })
    }
    .backgroundColor(Color.Black)
    .height('100%')
    .width('100%')
    .borderRadius('50%')
  }
}