clear,clc
input_layer_size  = 400;  
hidden_layer_size = 25;   
num_labels = 10; 

load('ex4data1.mat');
m = size(X, 1);

load('ex4weights.mat');

nn_params = [Theta1(:) ; Theta2(:)];

%% Part 1
X = [ones(m,1), X];
z2 = X * Theta1';
a2 = sigmoid(z2);
a2 = [ones(size(a2,1),1),a2];
z3 = a2 * Theta2';
a3 = sigmoid(z3);
h = a3;

y_v = zeros(m, num_labels);
for i = 1:m,
  y_v(i,y(i)) = 1;
endfor

J_1 = sum(sum(-(log(h).*y_v+log(1-h).*(1-y_v))/m));
J_2 = lambda/(2*m)*(sum(sum(Theta1(:,2:end).^2))+sum(sum(Theta2(:,2:end).^2)));
J = J_1 + J_2;
