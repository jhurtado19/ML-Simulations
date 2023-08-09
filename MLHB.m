%% Long Term Dynamics of Hopf Simulation

phase_portrait(1,50,10,250,false);
% In this plot we have visualized the long term dynamics of the
% Morris-Lecar model using Euler's Method, shades of blue indicate lower
% current values and increase to the red values. Based on this graph we can
% observe that the dynamics of this system undergo a Hpof Bifuraction as we
% can see that the critical values of this system change in two key areas,
% once from a focus, then a limit cycle appears at intermediate current
% values, and then another focus point attractor appears at high current
% levels. This is characteristic of a Hopf Bifuraction as we not that what
% was initially a stable critical point loses stability at some point and a
% limit cycle is born after this first bifurcation point, and then later,
% the critical points change again after another bifurcation point and become stable once more as a point
% attractor. This behavior is typical of Class II neurons.