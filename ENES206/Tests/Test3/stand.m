function out = stand(x)
%Standard deviation function

tot = 0;
for i = 1:length(x)
    tot = tot + (x(i) - avg(x))^2;
end
out = sqrt(tot/length(x));

end