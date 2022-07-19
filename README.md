# Autonomous UAV 
![Github All Releases](https://img.shields.io/github/downloads/josetv91/Autonomous-UAV/total?logo=GitHub&style=plastic)
![GitHub repo size](https://img.shields.io/github/repo-size/josetv91/Autonomous-UAV)
![GitHub language count](https://img.shields.io/github/languages/count/josetv91/Autonomous-UAV?color=success&logo=CodersRank&logoColor=%23FFFFFF)
[![version](https://img.shields.io/badge/version-1.1-red.svg)](//npmjs.com/package/Autonomous-UAV)

Based on my last research paper in 2021:

> LPV-MPC control and self-tuning feedback gains for the trajectory tracking of a quadcopter UAV
> http://iraj.doionline.org/dx/IJMPE-IRAJ-DOIONLINE-18111

The goal of this project is to control the autonomous navigation of a drone, making use of the equations that describe its atitude and position and implement a software and simulation environment that allows to test and compare the performace  against a Machine learning algorithm added in the control system.

---


## Software Implementation: Matlab/Octave
---
As an initial approach to simulate the drone navigation, the softwares Octave or Matlab have been utilized to provide trajectories and compute the equations of the state-space model. Due to the high non-linearities of the plant, a novel control method is yet to be tested and possibly compared against traditional control algorithms.  

In the clip below, we conducted two test to demostrate that indeed, ML can enhance the tracking path, decreasing the overshoot at the very beginning.

![Project Image](https://github.com/josetv91/Autonomous-UAV/blob/main/Videos/Autonomous%20UAV%20navigation.gif)
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

Two controllers are proposed to act in conjunction, the first controller is based on a Feedback input linearization technique (FC) that controls the position and the other method known as Model Predictive controller (MPC) is in charge of controlling the vehicle's attitude or orientation.

![Project Image](https://github.com/josetv91/Autonomous-UAV/blob/main/Images/control%20loop.png)

### Technologies

- Matlab/Octave

---


## How to use

### If you have Matlab or Octave
- Navigate to the [`Test/`](./Test/) directory and execute the `mainTestconference.m` file, then input the first variable `n` that suggest the program not to use the Machine learning algorithm.
A figure will show the UAV trajectory and predefined path, hit `TAB` after the simulation has been completed to run the next simulation with Machine Learning, observe both results to compare their performance, hit again `TAB` to the next other simulations.  
- For further studies, use the function `mainTestconferenceNo.m` file located in [`Test/`](./Test/), and input the following command:
    ```bash
    mainTestconferenceNo('y',axes('XLim',[-r-5 r+5],'YLim',[-r-5 r+5],'ZLim',[0 finalHeight+5]),xtakeoff,'g',2)
    ```
    Being:  
    * `'y'`: [y]es or [n]ot to  use Machine learning, `'n'` for not using it.
    * `r`: the radious of the elipse in meters
    * `finalHeight`: The maximun height that the spiral will reach in meters
    * `xtakeoff`: The initial take off point of the UAV based in a XYZ coordinate system, in meters
    * `g`: the color in which the UAV trajectory is going to be displayed, result of the control algorithm.
---

## References
<a id="1">[1]</a> 
C. Trapiello, V. Puig and B. Morcego, "Position-Heading Quadrotor Control using LPV Techniques". IET Control Theory & Applications, vol. 13, no. 6, 2019.  
<a id="2">[2]</a> 
K. Valavanis, G. Vachtsevanos, et al., "Handbook of Unmanned Aerial Vehicles", Aviation History and Unmanned Flight, pp. 135, 2015.  
<a id="2">[3]</a> 
M. Vasylenko, "Telemetry system of unmanned aerial vehicles", Electronics and Control Systems, vol 3, no.57, pp. 95-100.    
<a id="3">[4]</a> 
A. Salih, M. Moghavvemi, M. Haf, K. Gaeid, (2010). "Flight PID Controller Design for a UAV Quadrotor". Scientific Research and Essays, vol 5, pp. 3660-3667.  
<a id="4">[5]</a> 
H. Noshahri and H. Kharrati, "PID controller design for unmanned aerial vehicle using genetic algorithm," 2014 IEEE 23rd International Symposium on Industrial Electronics (ISIE), pp. 213-217, 2014.  
<a id="5">[6]</a> 
I. Ibraheem, A. Najm, "Nonlinear PID controller design for a 6-DOF UAV quadrotor system", Engineering Science and Technology, an International Journal, vol. 22, no. 4, pp. 1087-1097, 2019.  
<a id="6">[7]</a> 
P. Ru and K. Subbarao, "Nonlinear Model Predictive Control for Unmanned Aerial Vehicles", Aerospace, vol. 4, pp.2-31, 2017.  
<a id="7">[8]</a> 
J. Dentler, S. Kannan, M. A. O. Mendez and H. Voos, "A real-time model predictive position control with collision avoidance for commercial low-cost quadrotors," 2016 IEEE Conference on Control Applications (CCA), pp. 519-525, 2016.  
<a id="8">[9]</a> 
H. Cheng and Y. Yang, "Model predictive control and PID for path following of an unmanned quadrotor helicopter," 2017 12th IEEE Conference on Industrial Electronics and Applications (ICIEA), pp. 768-773, 2017.  
<a id="2">[10]</a> 
L. Singh and J. Fuller, "Trajectory generation for a UAV in urban terrain, using nonlinear MPC," Proceedings of the 2001 American Control Conference, vol.3, pp. 2301-2308, 2001.  
## Author's Info

- Email - [jose.tolentino.v@uni.pe](jose_antoniotv@hotmail.com)

[//]: # "Comment this line() - Websie - [some](some@pe) "
