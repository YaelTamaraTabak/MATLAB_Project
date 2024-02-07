function [v_A, v_B] = calc_concentrations2(input_data,A_start_conc)
v_A = zeros(1, size(input_data, 1));
v_B = zeros(1, size(input_data, 1));
v_A(1, 1) = A_start_conc;
for i = 1:(size(input_data, 1)-1)
    v_A(1, i+1) = v_A(1, i) - ((input_data(i+1, 2) - input_data(i, 2))/2);
    v_B(1, i+1) = v_B(1, i) + ((input_data(i+1, 2) - input_data(i, 2))/2);
end