clear;
load 'd2';
load 'd3';

[records, fields ] = size(d2);

d2 = [d2 ones(records, 1)]; % convert to homogeneous coordinate
d3 = [d3 ones(records, 1)]; 

% get Projection matrix by solving AP=0
A = [[d3 zeros(records,4) -d2(:,1).*d3] 
     [zeros(records,4) d3, -d2(:,2).*d3]
    ]; % Matrix A
[V , lambda] = eig(A'*A); % (t(A)*A)*v = lambda*v
[min_eig_val, idx] = min(sum(lambda)); % find argmin_eigvalue(eigvector)
P = reshape(V(:,idx), 4,3)' % get Projection Matrix ###

M = P(:,1:3);
% invM = QR -> K=inv(R); Rot=inv(Q)
[Q, R] = qr(inv(M));
K=inv(R) % get Calibration Matrix ###
Rot=inv(Q) % get Rotation Matrix ###
T=K\P(:,4) % get Translation Matrix ###

projectedD2 = (P*d3')';
projectedD2 = projectedD2./projectedD2(:,3); % convert from homogeneous coordinate
projection_error = mean(sqrt(sum((d2(:,1:2)-projectedD2(:,1:2)).^2,2))) % report projection error ### 