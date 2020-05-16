w1 = [0.28, 1.31,-6.2;0.07,0.58,-0.78;1.54,2.01,-1.63;
    -0.44,1.18,-4.32; -.81,0.21,5.73;1.52,3.16,2.77;
    2.20,2.42,-0.19;0.91,1.94,6.21;0.65,1.93,4.38;
    -0.26,0.82,-0.96]';

w2 = [0.011,1.03,-0.21;1.27,1.28,0.08;0.13,3.12,0.16;
    -0.21,1.23,-0.11; -2.18,1.39,-0.19;0.34,1.96,-0.16;
    -1.38,0.94,0.45; -0.12,0.82,0.17;-1.44,2.31,0.14;
    0.226,2.94,0.08]';

w3 = [1.36,2.17,0.14; 1.41,1.45,0.69;1.22,0.99,0.69;
    2.46,2.19,1.31;0.68,0.79,0.87;2.52,3.22,1.35;
    0.60,2.44,0.92; 0.64,0.13,0.97;0.85,0.58,0.99;
    0.66,0.51,0.88]';

test_points = [0.5, 1.0, 0.0; 0.31, 1.51, -0.5; -0.3, 0.44, -0.1]';

%4.2a
pzn_density_p1w1 = pzn_window(test_points(:,1), 1, w1)
pzn_density_p1w2 = pzn_window(test_points(:,1), 1, w2)
pzn_density_p1w3 = pzn_window(test_points(:,1), 1, w3)

pzn_density_p2w1 = pzn_window(test_points(:,2), 1, w1)
pzn_density_p2w2 = pzn_window(test_points(:,2), 1, w2)
pzn_density_p2w3 = pzn_window(test_points(:,2), 1, w3)

pzn_density_p3w1 = pzn_window(test_points(:,3), 1, w1)
pzn_density_p3w2 = pzn_window(test_points(:,3), 1, w2)
pzn_density_p3w3 = pzn_window(test_points(:,3), 1, w3)

%4.2b
pzn_density_p1w1 = pzn_window(test_points(:,1), 0.1, w1)
pzn_density_p1w2 = pzn_window(test_points(:,1), 0.1, w2)
pzn_density_p1w3 = pzn_window(test_points(:,1), 0.1, w3)

pzn_density_p2w1 = pzn_window(test_points(:,2), 0.1, w1)
pzn_density_p2w2 = pzn_window(test_points(:,2), 0.1, w2)
pzn_density_p2w3 = pzn_window(test_points(:,2), 0.1, w3)

pzn_density_p3w1 = pzn_window(test_points(:,3), 0.1, w1)
pzn_density_p3w2 = pzn_window(test_points(:,3), 0.1, w2)
pzn_density_p3w3 = pzn_window(test_points(:,3), 0.1, w3)



% figure()
% scatter3(w1(1,:),w1(2,:),w1(3,:), 'r*')
% hold on;
% scatter3(w2(1,:),w2(2,:),w2(3,:), 'g*')
% scatter3(w3(1,:),w3(2,:),w3(3,:), 'b*')
% scatter3(test_points(1,:),test_points(2,:),test_points(3,:),'k*', 'Linewidth', 2)
% legend('W1', 'W2', 'W3', 'Test Points')
% hold off;