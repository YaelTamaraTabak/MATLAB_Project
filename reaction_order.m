function reaction_order(A, t)
t = t.';
n0_fit = polyfit(t, A, 1);
ln = log(A);
n1_fit = polyfit(t, ln, 1);
fr = (1./A);
n2_fit = polyfit(t, fr, 1);
n0_val = polyval(n0_fit, t);
n1_val = polyval(n1_fit, t);
n2_val = polyval(n2_fit, t);
n0_res = (A - n0_val);
n1_res = (ln - n1_val);
n2_res = (fr - n2_val);
n0_res_sum = sum(n0_res.^2);
n1_res_sum = sum(n1_res.^2);
n2_res_sum = sum(n2_res.^2);
SStotal0 = (length(n0_val)-1) * var(n0_val);
SStotal1 = (length(n1_val)-1) * var(n1_val);
SStotal2 = (length(n2_val)-1) * var(n2_val);
rsq_n0 = 1 - (n0_res_sum./SStotal0);
rsq_n1 = 1 - (n1_res_sum./SStotal1);
rsq_n2 = 1 - (n2_res_sum./SStotal2);
figure(3);
plot(t, n0_val);
hold on;
plot(t, A, 'o');
xlabel('time [h]');
ylabel('concentration [M]');
title('[A] = -kt + [A]0');
figure(4);
plot(t, n1_val);
hold on;
plot(t, ln, 'o');
xlabel('time [h]');
ylabel('concentration [M]');
title('ln[A] = -kt + ln[A]0');
figure(5);
plot(t, n2_val);
hold on;
plot(t, fr, 'o');
xlabel('time [h]');
ylabel('concentration [M]');
title('1/[A] = -kt + 1/[A]0');
if abs(1-rsq_n2) < abs(1-rsq_n0) && abs(1-rsq_n2) < abs(1-rsq_n1)
    disp('The reaction is of second order.');
elseif abs(1-rsq_n1) < abs(1-rsq_n2) && abs(1-rsq_n1) < abs(1-rsq_n0)
    disp('The reaction is of first order.');
else
    disp('The reaction is of zero order.');
end