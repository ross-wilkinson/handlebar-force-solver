function [h1, h2] = solveHandlebarForce(A1,M,L10,L11,L12,L13,P1,P2)
%SOLVEHANDLEBARFORCE This function solves vertical handlebar forces at the
%left and right handlebar using the position of the pedals and handlebars
%and the rider's vertical center of mass acceleration.
%
% Assumption(s):
% 1. There were no forces on the saddle.
% 2. There is no thrust on the bicycle or rider's CoM. (Note: Thrust
% decreases contact force on the rear wheel).
% 3. Aerodynamic forces and rolling resistance were negligible. 
% 4. Weight and inertia of the bicycle itself are neglected. 
% 5. All lateral forces are ignored.
% 6. No attempt to achieve moment equilibrium of the handlebar, brakes, and
% front wheel assembly, which is free to rotate about the steering tube.
%
% Inputs: 
% - A1: vertical acceleration of rider's center of mass (m/s^2)
% - M: mass of rider (kg)
% - L10: lateral distance from right pedal to midline of bike (m)
% - L11: lateral distance from left pedal to midline of bike (m)
% - L12: lateral distance from right hand to midline of bike (m)
% - L13: lateral distance from left hand to midline of bike (m)
% - P1: vertical force on right pedal (N)
% - P2: vertical force on left pedal (N)
% Outputs:
% - H1: vertical force on right handlebar (N)
% - H2: vertical force on left handlebar (N)
%
% Equation(s):
% H1 + H2 + P1 + P2 + M * (g+A1) == 0 (Net vertical force == 0)
% H1 * L12 + H2 * L13 + P1 * L10 + P2 * L11 == 0 (Net torque in frontal plane == 0)
%
% Notes:
% Counter-clockwise torque is +ve when viewing system from the front
% i.e. downward force on right pedal or handlebar generates +ve torque

g = -9.80665;

syms H1 H2
eqnsHv = [H1 + H2 + P1 + P2 + M*(g+A1) == 0, H1*L12 + H2*L13 + P1*L10 + P2*L11 == 0];
[solH1, solH2] = solve(eqnsHv,[H1 H2]);
h1 = double(solH1);
h2 = double(solH2);
        
end

