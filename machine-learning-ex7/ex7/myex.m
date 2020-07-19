clear,clc
load('ex7data2.mat');

K = 3;
initial_centroids = [3 3; 6 2; 8 5];
idx = findClosestCentroids(X, initial_centroids);

[m n] = size(X);
centroids = zeros(K, n);

for i = 1:K
  cen = [0,0];
  total = 0;
  for j = 1:m
    if idx(j,:) == i
      cen = cen .+ X(j,:);
      total = total + 1;
    endif
  endfor
  centroids(i,:) = cen./total;
endfor