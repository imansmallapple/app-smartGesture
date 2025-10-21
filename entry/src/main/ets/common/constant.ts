import Touch from "../models/model"

export default class Constant {
  static crownAbilityList: string[] = [
    'Press',
    'Press and hold',
    'Press Launcher',
    'Press and hold for 3s',
    'Double press',
    'Turn counterclockwise',
    'Turn clockwise',
  ]

  static gestureList: Touch[] = [
    {
      title: "Touch",
      description: "Touch an element to activate the component or function",
      task: "Touch the toggle to turn on the bulb",
      image: 'app.media.touch'
    },
    {
      title: "Press and hold",
      description: "Press and hold an element to display additional controls or functions",
      task: "Press and hold to turn on the bulb",
      image: 'app.media.presshold'
    },

    {
      title: "Drag and drop",
      description: "Drag an element to move it",
      task: "Drag the thunder to charge the bulb",
      image: 'app.media.dragdrop'
    },

    {
      title: "Swipe",
      description: "Scroll the content vertically or swipe the screen horizontally",
      task: "Swipe the list to charge the bulb with thunder",
      image: 'app.media.swipe'
    },

    {
      title: "Double-tap",
      description: "Double-tap to zoom in or zoom out on the content",
      task: "Task",
      image: 'app.media.double_tap'
    },
    {
      title: "Pinch",
      description: "Pinch to zoom in or zoom out on the content",
      task: "Task",
      image: 'app.media.pinch'
    },
    {
      title: "Rotate",
      description: "Rotate the selected content",
      task: "Task",
      image: 'app.media.rotate'
    },
    {
      title: "Tap",
      description: "Tap the screen with a single knuckle to take a screenshot",
      task: "Task",
      image: 'app.media.tap'
    },
  ]

  static fruitList: string[] = [
    'app.media.apple',
    'app.media.blueberry',
    'app.media.orange',
    'app.media.passion_fruit',
    'app.media.pineapple',
    'app.media.thunder',
    'app.media.strawberry',
    'app.media.watermelon',
  ]

}
