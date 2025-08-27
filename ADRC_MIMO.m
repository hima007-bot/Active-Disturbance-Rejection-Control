s = tf('s');
G = [12.8/(16.7*s+1),-18.9/(21*s+1);6.6/(10.9*s+1),-19.4/(14.4*s+1)];
mdl_step = "DecoupledPlantIO";
open_system(mdl_step)
m = 1;
out = sim(mdl_step);
t1 = out.logsout{1}.Values.Time;
y1 = out.logsout{1}.Values.Data;
plot(t1,y1);
xlabel("time (s)")
ylabel("y1")
b1 = 0.75;
m = 2;
out = sim(mdl_step);
t2 = out.logsout{1}.Values.Time;
y2 = out.logsout{1}.Values.Data;
plot(t2,y2);
xlabel('time (s)')
ylabel('y2')
b2 = -1.3;
%%
Ts = 1; % sample time
mpc1 = mpc(G,Ts);
mpc1.Weights.ManipulatedVariablesRate = 0.7389*[1,1];
mpc1.Weights.OutputVariables = 0.1353*[1,1];
wc = 0.25;
wo = 3;
T = 45;
mdl = "ADRCWithBenchmarkMIMO";
open_system(mdl);
open_system(mdl + "/outputs")

%%
T = 150;
sim(mdl);
open_system(mdl + "/outputs")
open_system(mdl + "/inputs")