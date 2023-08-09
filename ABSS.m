%% Above threshold SNIC simulation

phase_portrait(2,50,20,150,true,"Above threshold SNIC Bifurcation");
% The above threshold dynamics for the SNIC simulation are revealing
% in the sense that we can see now how what begins as a limit cycle is
% eventualyl collapsed into a sink. This change in dynamics lets us known
% we have a bifurcation point that occurs somwhere around 100 pA, and this
% transition from oscillitory behavior to a sink is characteristic of a
% saddle node invariant cycle bifuraction. Moreover, the behavior of this
% model is represenative of that of class I neurons because the firing
% frequency can vary over a relatively large range of current inputs,
% starting at a relatively low frequency.