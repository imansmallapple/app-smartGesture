 # wearable app - smartGesture

## Content table
1. [Overview](#overview)
2. [Features](#features)
3. [Setup Instructions](#setup-instructions)


## Overview
This app demonstrates and tests various gesture and crown **smartGesture** is a lightweight wearable demo app for **Huawei Watch 5**, designed to demonstrate and test **gesture** and **crown (button)** interactions.  
It helps developers verify the system’s response to different operations such as taps, swipes, button clicks, and long presses.

The app covers both **touch-based gestures** and **hardware button actions**, offering visual feedback on the watch screen for each interaction.

UI effects is as following:
![image1.png](images%2Fimage1.png)
![image2.png](images%2Fimage2.png)
![image3.png](images%2Fimage3.png)
![image4.png](images%2Fimage4.png)
![image5.png](images%2Fimage5.png)

## Features
- 🖐️ **Screen Interaction**
  - Touch, Press and hold, Drag and drop, Swipe,Tap, Double tap, Pinch and Rotate.
  - Detects on-screen gesture areas and displays animated responses

- 🎛️ **Crown (Button) Operations**
  - **Press**
    1. Screen off           → press to wake up,
    2. On main screen → press to open app gallery,
    3. In other screen  → press to return main screen,
    4. Incoming call     → press to mute the call,
  - **Press and hold**
    1. Screen off → Hold to power on,
    2. Screen on → Hold to restart/shutdown menu,
    3. Screen on → Hold >12s to force restart
  - **Double press**
    1. Screen on            → Double press to show running apps,
    2. While exercising → Double press to open background tasks
  - **Rotate**
    1. Rotate the crown counterclockwise or clockwise

- 📱 **Screen States**
  - Return to watch index page when in sub-pages
  - Disable side-swipe back for custom navigation

- 🎨 **Visual Feedback**
  - Each interaction provides basic usage information and triggers simple effect with bulb.
  - Easy to verify interaction mapping and transitions.

---

## Setup Instruction
**1. Clone the repository**
```bash
git clone https://github.com/eclipse-oniro4openharmony/wearable-smartGesture.git
```

**2. Build and Deploy**
* Ensure you are using API level higher than 18 
* Confirm your app is a `system-level` application
* Connect the watch using IP connection
* Sign the application with valid signature configurations
* Click `run` on DevEco Studio to install the application

> **Note:**
>
> See this [tutorial](https://docs.oniroproject.org/application-development/codeLabs/) for how to configure the project as a `system-level` application.

