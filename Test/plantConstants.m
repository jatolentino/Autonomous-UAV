classdef plantConstants

  % BASED on the UAV Asctec Hummingbird datasheet 
   properties (Constant)
   Ix = 0.0034          % [kg*m^2]  Moment of nertia in Y
   Iy = 0.0034          % [kg*m^2]  Moment of inertia in X
   Iz = 0.006           % [kg*m^2]  Moment of inertia in Z[kg*m^2]
   m = 0.698            % [kg]      Drone mass
   g = 9.807            % [m*s^2]   Earth gravity
   Jtp = 1.302*10^(-6)  % [N*m*s^2] = kg*m^2 Moment of inertia of the propellers
   Ts = 0.1             % [s]       Sample time
 
   % Matrix weights
   Q = [10 0 0; 0 10 0; 0 0 10]     % Ouput weights
   S = [20 0 0; 0 20 0; 0 0 20]     % Final horizon weights 
   R = [10 0 0; 0 10 0; 0 0 10]     % Input weights
   
   % coefficients
   ct = 7.6184*10^(-8)*(60/(2*plantConstants.pi))^2    % [N*s^2]
   cq = 2.6839*10^(-9)*(60/(2*plantConstants.pi))^2    % [N*s^2]
   end
end
