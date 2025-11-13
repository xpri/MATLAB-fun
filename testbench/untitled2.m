prm = primes(40);
for i = 1:12
    fprintf('%d\n',prm(i))
end
fprintf('--------- \n')
fprintf('Even numbers from 2 to 40')
for i = 2:40
    fprintf('%d %d\n',i,i+2)
end