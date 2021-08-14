# Autonomous UAV 

![GitHub all releases](https://img.shields.io/github/downloads/josetv91/Autonomous-UAV/total?logo=GitHub&style=plastic)
![GitHub repo size](https://img.shields.io/github/repo-size/josetv91/Autonomous-UAV)
![GitHub language count](https://img.shields.io/github/languages/count/josetv91/Autonomous-UAV?color=success&logo=CodersRank&logoColor=%23FFFFFF)

Based on my last research paper in 2021:

> LPV-MPC control and self-tuning feedback gains for the trajectory tracking of a quadcopter UAV

The goal of this project is to control the autonomous navigation of a drone, making use of the equations that describe its atitude and position an implenent a software and simulation environment that allows to test the performace when a Machine learning algorithm is added to the control system study.

---
## Software Implementation: Matlab/Octave
---
As an initial approach to simulate the drone navigation, the softwares Octave or Matlab have been utilized to provide trajectories and compute the equations of the state-space model. Due to the high non-linearities of the plant, a novel control method is yet to be tested and possibly compared against traditional control algorithms.  

In the clip below, we conducted two test to demostrate that indeed, ML can enhance the tracking path and decrease the overshoot at the very beginning of the UAV autonomous navigation.

![Project Image](https://github.com/josetv91/Autonomous-UAV/blob/main/Videos/Autonomous-UAV.gif)

---

## Table of Contents

Feel free to download the software installer in the How-to-use section.

- [Description](#description)
- [How To Use](#how-to-use)
- [References](#references)
- [License](#license)
- [Author's Info](#author-info)

---


## Description
---
### Dynamics
The following state-space equations describe the UAV motion. The first three equations might relate the position while the last three, its attitude (orientation).

<!-- gray #f4f4f4     #f0f4f4 light blue  -->

<div align="center" style="background: #f4f4f4"><img style="background: #f4f4f4 ;" src="https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0A%5Cddot%7BX%7D+%26+%3D+%5Bcos%28%5Cphi_R%29%5Ccdot+cos%28%5Ctheta_R%29+%5Ccdot+cos%28%5Cpsi_R%29+%2B+sin%28%5Cphi_R%29+%5Ccdot+sin%28%5Cpsi_R%29+%5D+%5Cfrac%7BU_1%7D%7Bm%7D%5C%5C%0A%5Cddot%7BY%7D+%26+%3D+%5Bcos%28%5Cphi_R%29%5Ccdot+sin%28%5Ctheta_R%29+%5Ccdot+sin%28%5Cpsi_R%29+-+sin%28%5Cphi_R%29+%5Ccdot+sin%28%5Cpsi_R%29+%5D+%5Cfrac%7BU_1%7D%7Bm%7D+%5C%5C%0A%5Cddot%7BZ%7D+%26+%3D+-g+%2B+cos%28%5Cpsi_R%29+%5Ccdot+cos%28%5Ctheta_R%29+%5Cfrac%7BU_1%7D%7Bm%7D%5C%5C%0A%5Cddot%7B%5Cphi%7D+%26%3D+%5Cfrac%7BI_%7Byy%7D-I_%7Bzz%7D%7D%7BI_%7Bxx%7D%7D%5Cdot%7B%5Ctheta%7D%5Cdot%7B%5Cpsi%7D+%2B+%5Cfrac%7BJ_%7BTP%7D%7D%7BI_%7Bxx%7D%7D%5Cdot%7B%5Ctheta%7D%5COmega+%2B+%5Cfrac%7BU_2%7D%7BI_%7Bxx%7D%7D+%5C%5C%0A%09%5Cddot%7B%5Ctheta%7D+%26%3D+%5Cfrac%7BI_%7Bzz%7D-I_%7Bxx%7D%7D%7BI_%7Byy%7D%7D%5Cdot%7B%5Cphi%7D%5Cdot%7B%5Cpsi%7D+-+%5Cfrac%7BJ_%7BTP%7D%7D%7BI_%7Byy%7D%7D%5Cdot%7B%5Cphi%7D%5COmega+%2B+%5Cfrac%7BU_3%7D%7BI_%7Byy%7D%7D+%5C%5C%0A%09%5Cddot%7B%5Cpsi%7D+%26%3D+%5Cfrac%7BI_%7Bxx%7D-I_%7Byy%7D%7D%7BI_%7Bzz%7D%7D%5Cdot%7B%5Cphi%7D%5Cdot%7B%5Ctheta%7D+%2B+%5Cfrac%7BU_4%7D%7BI_%7Bzz%7D%7D%0A%5Cend%7Balign%2A%7D"></div>

### Control loop

Two controllers are proposed to act in conjunction, where the first controller is based on Feedback input linearization technique (FC) that controls the position and the other known as Model Predictive controller (MPC) is in charge of controlling the vehicle's attitude.

![Project Image](https://github.com/josetv91/Autonomous-UAV/blob/main/Images/controloop.png)

### Technologies

- Matlab/Octave
- Aerospace toolboox
- App designer

[Back To The Top](#read-me-template)
---
## How To Use
1. Set the take of Point
2. Set the Path starting point (landing pad)
3. Choose the type of path to use
4. Plot the desired path to be tracked and the landing pad to show up
5. Set the UAV to show the drone
6. Turn on the four UAV rotors
7. Choose to use or not Machine learning option to enhace path tracking
8. Finally start the simulation by clicking in the Initialize button

### Installation
### If you have Matlab runtime (or simply the software Matlab)
Please navigate to the Installer folder and download the UAVnav.exe file

### If you don't have Matlab software

#### API Reference

```html
    <p>dummy code</p>
```

[Back To The Top](#read-me-template)

---

## References
[Back To The Top](#read-me-template)

---


## License

## Author Info

- Twitter - [jose.tolentino.v@uni.pe](https://twitter.com/some)
- Website - [some](https://some.com)

[Back To The Top](#read-me-template)
