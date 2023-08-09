%% Near Threshold Hopf simulation

phase_portrait(1,25,5,80,true,"Near threshold Hopf Bifurcation");
% Low current values do not generate a spike, and these isolated spikes
% do not lead to constant spiking behavior, and are terminated shortly
% after their generation. This is likely due to the fast activating and
% voltage sensitive activity of the K potassium rectifier current. As we
% continue to increase the current, it seems that a stable point attractor
% appears, as well as what may be an unstable limit cycle. The existence of
% an unstabe limit attractor here could be verified by plotting points in
% the phase portait with initial conditions inside the bounds of the
% proposed limit cycle, and we would expect them to point outwards from
% their origin. This would make sense for small purturbations from rest of
% this neuron will cause it depolarize and then fall back down to rest if
% above a critical value, or if below it, cause the membrane to
% hyperpolarize towards it. This critical value is the threshold potential.
% Additionally, this Hopf simulation shows very short firing latency,
% consistent with class II neurons.