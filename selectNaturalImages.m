function selectNaturalImages(start)

for i=1:20
    subplot(4, 5, i);
    a = checkNatImage(i+start-1, 0);
    a = a(1:768, 1:768);
    imshow(a);
end

% cd01A/36