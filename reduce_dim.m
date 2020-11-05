function [reduced_points] = reduce_dim(raw_points, min_percent)
%REDUCE_DIM INPUT: raw points | OUTPUT: new points

[coeff, score, latent] = pca(raw_points);

latent;

total = sum(latent);
percent_mat = tril( repmat(flip(latent), 1, length(latent)) );
percent_mat = sum(percent_mat) / total
num_dim = length(percent_mat) - find(percent_mat < min_percent, 1) + 2
coeff = coeff(:, 1:num_dim);
score = score(:, 1:num_dim);

scatter3(score(:,1)', score(:,2)', score(:,3)',...
    'MarkerEdgeColor','k',...
        'MarkerFaceColor',[0 .75 .75])
    view(-30,10);
reduced_points = score;

end