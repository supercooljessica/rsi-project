function [new_points] = fixed_r_points(points, radius)

%FIXED_R_POINTS INPUT: points, radius | OUTPUT: integer points

min_col = min(points')';
points = points - min_col;
new_points = floor(points ./ radius) + 1;

end
