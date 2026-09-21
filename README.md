# Radar System using Arduino

An Arduino-based Radar System that uses an ultrasonic sensor and servo motor to detect objects and display their position on a computer screen using Processing.

## Project Overview

This project works like a simple radar system. The servo motor rotates the ultrasonic sensor through different angles. The ultrasonic sensor detects objects and measures their distance.

The Arduino sends the angle and distance information to the computer through the Serial Monitor/USB connection. The Processing program receives this data and displays it as a radar-style visualization.

## Components Required

- Arduino Uno
- HC-SR04 Ultrasonic Sensor
- Servo Motor
- Jumper Wires
- Breadboard
- USB Cable
- Computer/Laptop

## Software Required

- Arduino IDE
- Processing IDE

## Arduino Connections

| Component | Arduino Pin |
|---|---|
| HC-SR04 VCC | 5V |
| HC-SR04 GND | GND |
| HC-SR04 TRIG | D9 |
| HC-SR04 ECHO | D10 |
| Servo Signal | D6 |
| Servo VCC | 5V |
| Servo GND | GND |

## Files in this Repository

### `radarsystem.ino`

This is the Arduino code. It:

- Controls the servo motor
- Sends the ultrasonic sensor to different angles
- Measures the distance of objects
- Sends angle and distance data through Serial communication

### `Radar_System.pde`

This is the Processing code. It:

- Receives data from Arduino
- Converts the data into a radar display
- Shows the detected object's angle
- Shows the detected object's distance
- Creates a visual radar interface

## How It Works

1. The servo motor rotates the ultrasonic sensor.
2. The ultrasonic sensor sends ultrasonic waves.
3. The waves reflect back when they hit an object.
4. The sensor measures the distance of the object.
5. Arduino calculates the distance and angle.
6. Arduino sends the data to the computer.
7. Processing receives the data.
8. Processing displays the detected object on the radar screen.

## Project Flow

Arduino + Ultrasonic Sensor + Servo Motor
        ↓
Object Detection
        ↓
Distance & Angle Data
        ↓
USB Serial Communication
        ↓
Processing
        ↓
Radar Visualization

## Applications

- Object detection
- Robotics projects
- Security systems
- Educational demonstrations
- Distance measurement
- Basic surveillance concepts

## Future Improvements

- Add a buzzer for object detection
- Add an LCD/OLED display
- Increase detection range
- Add automatic object tracking
- Add a camera for visual identification
- Improve the radar interface

## Author

Anjali Gupta

## Project Type

Arduino and Robotics Project
