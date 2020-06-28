clear all

% Init of the system
A = [-5 0; 1 -8]
B = [1; 0]

% Test controllability
Wc = [B A*B]
if det(Wc) == 0
    fprintf('Uncontrollable')
end

% expensive state changes
% Define Q and R
% bigger Q comes faster poles. Q defines the weights on the sates.

% expensive control
% bigger R slower the poles. R defines the weights on the control input.
Q1 = [10 0; 0 100]
R1 = 1

%% Control Design
K = lqr(A, B, Q1, R1)
% position eigenvalues control
lc = eig(A-B*K)

%% Close loop without observer
Ts = 0.001
Ac12 = [A-B*K]
eso12 = expm(Ac12*Ts)

% initial condition
x2(:,1) = [5; 5]

%% Plot the transient response
npoints = 600;
for i=1:npoints
    t(i) = (i-1)*Ts;
    x2(:, i+1) = eso12*x2(:, i);
    u(i) = K*x2(:, i);
end
t(i+1) = npoints*Ts;
u(i+1) = K*x2(:,i+1);

plot(t, x2(2,:), 'b', t, u, 'r')