function [num_boxes, id_order_simplified, map] = id_boxes(int_points)

%ID_BOXES INPUT: integer points | OUTPUT: number of boxes, list of IDs, map

make_map = unique(int_points(:,:)','rows')';
num_boxes = length(make_map(1,:));
make_map = cellstr(num2str(make_map'))';
int_points = cellstr(num2str(int_points'))';
map = containers.Map(make_map, 1:num_boxes);
id_order_simplified = cell2mat( values(map, int_points) );

%{
%this does not work for large dim / small radius
base = max(max(int_points)) + 1;
place_value = length(int_points(:,1));
pow_vec = base.^ (0:(place_value-1))';
id_order = (int_points' * pow_vec)';

% set new values for id_order
increasing_order = unique(id_order);
num_boxes = length(increasing_order);
map = containers.Map(increasing_order, 1:num_boxes);
id_order_simplified = cell2mat( values(map, num2cell(id_order)) );
%}

end

