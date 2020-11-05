function [matrix] = transition_matrix(id_points)
%TRANSITION_MATRIX INPUT: list of ID points | OUTPUT: transition matrix

id_points_shifted = circshift(id_points, -1);
size = max(id_points);
id_points(end) = []; id_points_shifted(end) = [];

matrix = sparse(id_points', id_points_shifted', 1, size, size);

average = sum(matrix);
divide_by = repmat(average, size, 1);
matrix = matrix ./ divide_by;
matrix(isnan(matrix)) = 0;

end