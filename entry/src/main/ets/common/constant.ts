import Gesture from "../models/model"

export default class Constant {
  static crownAbilityList: Gesture[] = [
    {
      title: "Press",
      description: "Press the crown then release it",
      task: "Task",
      image: 'app.media.touch'
    },
    {
      title: "Press and hold",
      description: "Press the crown and hold it",
      task: "Task",
      image: 'app.media.touch'
    },
    {
      title: "Double press",
      description: "Double press the crown",
      task: "Task",
      image: 'app.media.touch'
    },
    {
      title: "Rotate",
      description: "Rotate the crown counterclockwise or clockwise",
      task: "Rotate the crown to charge the bulb",
      image: 'app.media.touch'
    },
  ]

  static pressAbility: string[] = [
    '1. Screen off           → press to wake up',
    '2. On main screen → press to open app gallery',
    '3. In other screen  → press to return main screen',
    '4. Incoming call     → press to mute the call',
  ]

  static pressHoldAbility: string[] = [
    '1. Screen off → Hold to power on',
    '2. Screen on → Hold to restart/shutdown menu',
    '3. Screen on → Hold >12s to force restart'
  ]

  static doublePressAbility: string[] = [
    '1. Screen on            → Double press to show running apps',
    '2. While exercising → Double press to open background tasks'
  ]

  static gestureList: Gesture[] = [
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
      task: "Double tap to enlarge the thunder",
      image: 'app.media.double_tap'
    },
    {
      title: "Pinch",
      description: "Pinch to zoom in or zoom out on the content",
      task: "Pinch to enlarge the thunder",
      image: 'app.media.pinch'
    },
    {
      title: "Rotate",
      description: "Rotate the selected content",
      task: "Rotate the arrow to proper angle",
      image: 'app.media.rotate'
    },
    {
      title: "Tap",
      description: "Tap the screen with a single knuckle to trigger an action",
      task: "Tap the cloud to give thunder",
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
