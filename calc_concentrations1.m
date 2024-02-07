function [v_n2o5, v_no2, v_n2, v_o2, dt] = calc_concentrations1(start_conc,k1,k2,dt)
v_n2o5 = zeros(1, 10000/dt);
v_no2 = zeros(1, 10000/dt);
v_n2 = zeros(1, 10000/dt);
v_o2 = zeros(1, 10000/dt);
v_n2o5(1, 1) = start_conc;
for i = 1:(10000/dt-1)
    v_n2o5(1, i+1) = v_n2o5(1, i)*exp(-(k1*dt));
    v_no2(1, i+1) = (v_no2(1, i) + (v_n2o5(1, i)-v_n2o5(1, i+1))*2)*exp(-(k2*dt));
    v_n2(1, i+1) = v_n2(1, i) + ((v_no2(1, i) + (v_n2o5(1, i)-v_n2o5(1, i+1))*2)-((v_no2(1, i) + (v_n2o5(1, i)-v_n2o5(1, i+1))*2)*exp(-(k2*dt))))*0.5;
    v_o2(1, i+1) = v_o2(1, i) + (v_n2o5(1, i)-v_n2o5(1, i+1))*0.5 + ((v_no2(1, i) + (v_n2o5(1, i)-v_n2o5(1, i+1))*2)-((v_no2(1, i) + (v_n2o5(1, i)-v_n2o5(1, i+1))*2)*exp(-(k2*dt))));
end