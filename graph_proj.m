close all, clear all, clc
raw_data = load('run_0.mat');
raw_data = raw_data.obs';

hold on;

dim1 = 1;
dim2 = 2;

%plot(raw_data(dim1,:), raw_data(dim2,:), 'b-');
comet(raw_data(dim1,:), raw_data(dim2,:));
plot(raw_data(dim1,end), raw_data(dim2,end), 'ro');

