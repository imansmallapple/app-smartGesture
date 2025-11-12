# wearable app - smartGesture

## Content table

1. [Overview](#overview)
2. [Features](#features)
3. [Setup Instruction](#setup-instruction)

## Overview

This app demonstrates and tests various gesture and crown **smartGesture** is a lightweight wearable demo app for **Huawei Watch 5**, designed to demonstrate and test **gesture** and **crown (button)** interactions.  
It helps developers verify the system’s response to different operations such as taps, swipes, button clicks, and long presses.

The app covers both **touch-based gestures** and **hardware button actions**, offering visual feedback on the watch
screen for each interaction.

UI effects is as following:  
![image1.png](images%2Fimage1.png)
![image2.png](images%2Fimage2.png)
![image3.png](images%2Fimage3.png)
![image4.png](images%2Fimage4.png)
![image5.png](images%2Fimage5.png)
![image6.png](images%2Fimage6.png)
![image7.png](images%2Fimage7.png)

## Features

- 🖐️ **Screen Interaction**
    - Touch, Press and hold, Drag and drop, Swipe,Tap, Double tap, Pinch and Rotate.
    - Detects on-screen gesture areas and displays animated responses

- 🎛️ **Crown (Button) Operations**
    - **Press**
        1. Screen off → press to wake up,
        2. On main screen → press to open app gallery,
        3. In other screen → press to return main screen,
        4. Incoming call → press to mute the call,
    - **Press and hold**
        1. Screen off → Hold to power on,
        2. Screen on → Hold to restart/shutdown menu,
        3. Screen on → Hold >12s to force restart
    - **Double press**
        1. Screen on → Double press to show running apps,
        2. While exercising → Double press to open background tasks
    - **Rotate**
        1. Rotate the crown counterclockwise or clockwise


> **illustrate**  
> Use the Smart Gestures feature to turn on the Smart Gesture Recognition switch on your device.

- 📱**Smart Gestures**  
  Smart gestures are a unique perception interaction method of smart wearable devices in addition to screen interaction, crown interaction and button interaction. In scenarios that require one-handed processing, users can use tapping fingers and sliding knuckles to control and switch choices.

    - **Interaction Scenarios**
        - Remind the scene, control that needs to be dealt with in time, such as phone calls, alarm clocks, etc.
        - Convenient control of high-frequency usage scenarios, such as the "next song" of the broadcast control center.
        - Scenes where it is inconvenient to click with both hands, such as remote control photography.

    - **Pinch Confirmation**  
    ![gif2.gif](images%2Fgif2.gif)  

    - Quickly touch your thumb and index finger twice to confirm the current focus. It is often used in scenarios such as
    confirmation key, music pause/playback, etc.  

        - Implementation principle: After the system recognizes the gesture, the component's `onKeyEvent` event will be triggered, with `KeyCode` as `KEYCODE_ENTER` and type as `KeyType.Down`, and the application can perform functions after this condition is triggered, such as pausing music.

    - **Swipe to focus**  
    ![gif1.gif](images%2Fgif1.gif)  
    
    - Switch the current focus to confirm the next action, by quickly sliding the thumb along the second joint of the index finger to the fingertip to switch the focus, and then confirm the operation, which can be used to switch to the cancel button, or switch to the next button to play the next song, for canceling messages, switching songs and other operation scenarios.

        - Implementation principle: After the system recognizes the gesture, the `onBlur` and `onFocus` events of the out-of-focus component and the focus component will be triggered respectively, and the application can perform functions after this condition is triggered, such as changing the style of the focus component to highlighting.

---

## Setup Instruction

**1. Clone the repository**

```bash
git clone https://github.com/eclipse-oniro4openharmony/app-smartGesture.git
```

**2. Build and Deploy**

* Ensure you are using API level higher than 18
* Connect the watch using IP connection
* Sign the application with valid signature configurations
* Click `run` on DevEco Studio to install the application
