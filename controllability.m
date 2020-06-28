A = [1 0; 0 2]
B = [0; 1]

ctrbility = rank(ctrb(A, B)) == rank(A);
if ctrbility == 1
    disp("Controllable")
else
    disp("Uncontrollable")
end