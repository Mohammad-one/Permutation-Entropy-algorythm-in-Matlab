function out = pe_final(s, taw, d)
%s = [4, 7, 9, 10, 6, 11, 3];

len_string = length(s);

%taw = 1;
%d = 3;
x = len_string - d + 1; % x is number of colimns that we have:)
y = d;
B = [0, 0, 0]';

for i = 1:taw:x
    A = [s(i), s(i+1), s(i+2)]';
    B = [B A];
end
x
B(:,1) = [];
I = ones(y,x);

B
[out_asli, idx] = sort(B);
[out, idx_asli] = sort(idx);
out_asli;
idx_we_want = idx_asli - I % here we decide to calculate index of our main index
v = idx_we_want(:,1);
Permutation_matrix = perms(v)'

len_main_pi = length(Permutation_matrix);
pi = zeros(1,len_main_pi,'uint32');



for i = 1:len_main_pi
    for j = 1:x
        if sum(Permutation_matrix(:,i) == idx_we_want(:,j)) == y
            pi(i) = pi(i) + 1;
        end
    end
end        

pi = double(pi);
divid_matrix = 5;
main_pi = pi / divid_matrix

%PE_d = - sigma(  p(i)*log2(p(i))  )
sum = 0;
sum = double(sum);

for i = 1: factorial(d)
    if main_pi(i)~=0
    sum = sum + double(main_pi(i)*double(log2(main_pi(i))));
    end
end
 

out = -sum
end