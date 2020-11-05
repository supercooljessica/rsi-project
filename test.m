clear all, close all, clc

raw_data = load('run_0.mat');
raw_data = raw_data.obs';

% scale/shift to mean 0, var 1
raw_data = normalize(raw_data')';

% pca
%pca_data = reduce_dim(raw_data', .8)';
%pca_data = normalize(pca_data')';

% interval points, using fixed r OR fixed # boxes
int_points = fixed_r_points(raw_data, 1);

% ID boxes, store dictionary
[num_boxes, id_order_simplified, map] = id_boxes(int_points);
num_boxes

% create transition matrix
T = transition_matrix(id_order_simplified)
[eigvec, eigval] = eigs(T);
%stable = eigvec(:,1);
%stable = stable / sum(stable)

% eigenanalysis
T_part = T;
I = eye(length(T_part(:,1)));
OnesVec = ones(length(T_part(:,1)),1);
m_part = inv(I-T_part) * OnesVec;

[V,D] = eigs(T');
lambda = diag(D);
[Lsort,id] = sort(abs(lambda))
Lcrit = Lsort(end)
VecMetastable = abs(V(:,id(end)));
[VecMetastable (1:length(VecMetastable))'];

index1 = 1;
index2 = 2;
important_points(VecMetastable, map, index1, index2);
VecMetastable = VecMetastable / sum(VecMetastable);
max(VecMetastable) * 1000;
VecMetastable * 1000;
