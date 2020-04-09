function x_r = Gerchberg_Saxton_Algorithm(A,y,t)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%% =========================================== iteration
% initial
[eVector,eValue] = eig(A*diag(y,0)*conj(A.'));
eValue = diag(eValue);
[~,Iv]=sort(eValue,'descend');
x_k = eVector(:,Iv(1));
% x_k = rand(n,1)+1i*rand(n,1);
% x_k = x_k/norm(x_k,2);
object = norm(sqrt(y)-abs(conj(A.')*x_k),2)^2;
disp(['��0�ε����Ż�Ŀ�����ֵ��',num2str(object)]);
for k = 0:t-1
    c = exp(1i*angle(conj(A.')*x_k));
    x_k = (A*conj(A.'))\(A*diag(sqrt(y),0)*c);
    object = norm(sqrt(y)-abs(conj(A.')*x_k),2)^2;
    disp(['��',num2str(k+1),'�ε����Ż�Ŀ�����ֵ��',num2str(object)]);
    if object < 1e-4
       break 
    end
end
    x_r = x_k;
end

