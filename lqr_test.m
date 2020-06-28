clear all, clc

% 1. Define A and B
A = [0 1; 0 -0.2];
B = [0; 1];

% 2. Choose Q and R
Q = [1 0; 0 1];
R = 0.01;

% 3. Solve ARE
syms S11, syms S12, syms S21, syms S22;
% Define S as a symmetric matrix of size n by n
% S = [S11 S12; S12 S22];

% LHS = A'*S + S*A - S*B*inv(R)*B'*S + Q 
% tmp = solve(LHS(1,1)==0, LHS(1,2)==0, LHS(2,1)==0)
% [ K, S, E] = lqr(A,B,Q,R)


% Try different scenario
scenario = 3;   %1 = cheap control
                %2 = expensive control
                %3 = ignore position
                
switch scenario
    case 1
        Q = eye(2);
        R = 0.01;
    case 2
        Q = eye(2);
        R = 1000;
    case 3
        Q = [0.001 0; 0 10];
        R = 1;
    otherwise
        error('Unknown scenario')
end

[ K, S, E] = lqr(A,B,Q,R)

t_final = 30;
x0 = [pi; 
    -2];

result = sim('lqr_model')
%extract data
t = result.sim_x.time;
x1 = result.sim_x.signals.values(:,1);  
x2 = result.sim_x.signals.values(:,2);
u1 = result.sim_u.signals.values(:,1);

% plot
figure
subplot(3,1,1)
title(['scenario', num2str(scenario)])
plot(t, x1, 'LineWidth', 3)
grid on
legend('x_1')

subplot(3,1,2)
plot(t, x2, 'LineWidth', 3)
grid on
legend('x_2')

subplot(3,1,3)
plot(t, u1, 'LineWidth', 3)
grid on
legend('u_1')
