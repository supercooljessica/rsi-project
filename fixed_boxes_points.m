function [new_points] = fixed_boxes_points(points, num_boxes)
%FIXED_BOXES_POINTS INPUT: points, num boxes | OUTPUT: integer points

min_col = min(points')';
points = points - min_col;
rad_col = max(points')' / num_boxes;
new_points = floor( points ./ repmat(rad_col, 1, length(points(1,:))) ) + 1;

end

