clear all, close all, clc

raw_data = load('run_0.mat');
raw_data = raw_data.obs';
%[pointsx, pointsy] = getpts();
%raw_data = [pointsx', pointsy'];


% scale/shift to mean 0, var 1
raw_data = normalize(raw_data')';

num_sample = 1000;
samples = zeros(2, num_sample);
for r = 250:num_sample
    radius = 0.01 * r;
    samples(1,r) = 1/radius;
    int_points = fixed_r_points(raw_data, radius);
    [num_boxes, id_order_simplified, map] = id_boxes(int_points);
    samples(2,r) = num_boxes;
end

samples = samples(:,400:(end-350))
samples = log(samples)

x = samples(1,:); y = samples(2,:);

plot(x, y, '.');
xlabel('$\log \frac{1}{\varepsilon}$','Interpreter','latex', 'FontSize', 15);
ylabel('$\log N(\varepsilon)$','Interpreter','latex', 'FontSize', 15)

coefficients = polyfit(x, y, 1)
xFit = linspace(min(x), max(x), 1000);
yFit = polyval(coefficients , xFit);
hold on;
axis equal;
plot(xFit, yFit, 'r-', 'LineWidth', 1);