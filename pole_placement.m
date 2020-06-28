A = [-1 -2; 1 -0.4];
B = [1; -2];
C = [3 4];
D = [0];
syms s, syms k1, syms k2;

poles = eig(A)


% Simulation settings
t = 0:0.01:2;
u = zeros(size(t));
x0 = [0.01 0 0];

% Check properties
co = ctrb(A,B); % controllability matrix
ob = obsv(A,C); % observability matrix
Controllability = rank(co)
Observability = rank(ob)

poles = [-1 -2]
K = place(A, B, poles)
eig(A-B*K)
%eig(A-B*[-0.5641 -1.0821])

(5*s^2 + 7*s + 12)* (inv(s*eye(2)-A)./5)
C*[ s+0.4 -2; 1 s + 1]*B / (s^2 + 1.4*s +2.4)
Aa = [0 1; -2.4 -1.4]
Bb = [0; 1]
Q = ctrb(Aa, Bb)

det([s+1+k1 2+k2; -(1+2*k1 ) s+0.4-2*k2])