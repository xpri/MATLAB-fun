function out = avg(x)
%Finds average of x


c = 0;
for i = 1:1:length(x)
    c = c + x(i);
end

out = c/length(x);

end

