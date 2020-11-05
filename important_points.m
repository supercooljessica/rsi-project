function [] = important_points(eigvec, map, index1, index2)
%IMPORTANT_POINTS INPUT: eigenvector, states map | OUTPUT: plot important spots

map = containers.Map(values(map), keys(map));
new_map = containers.Map('keyType', 'double', 'valueType', 'any');
for i = 1:length(map)
    new_map(i) = str2num(map(i));
end

centers = zeros(length(eigvec'), 2);
radii = eigvec * 5;

all_vals = values(new_map);
all_vals = cell2mat(all_vals');
x_centers = all_vals(:, index1);
y_centers = all_vals(:, index2);

centers = [x_centers y_centers];

axis equal;
viscircles(centers, radii);

end