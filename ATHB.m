%% Above Threshold Hopf Simulation

phase_portrait(1,90,30,240,true,"Above threshold Hopf Bifurcation");
% Hopf bifurcations are characterized by the onset of oscillitaroy behavior (or regular spiking) after a certain
% point known as the bifuraction point which, is 100 picoamps in this simulation. This is supported by the
% graph because below this value, the dynamics behave like a sink, and then
% abruptly become a limit cycle. This could be confirmed via nullclines and
% linear stability analysis and classified as a stable limit cycle. This
% transition is a bifurcation point. Eventually, we encounter another
% bifurcation point where the limit cycle collapses into another sink at
% around 110 picoamps, and the voltage trace shows that spiking stops after
% this point, and the calcium currents at this point likely stay open
% chronically and cannot be hyperpolarized back to rest and instead come to
% steady state at some new threshold value. Perturbations above and below
% this value will eventually lead back to this value. These dynamics are
% characteristic of class II neurons.