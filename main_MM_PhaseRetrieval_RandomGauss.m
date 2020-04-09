%----------------------------------------------------------------
% ����: MM_PhaseRetrieval_DFT.m
% ����: ֣Ʒ��
% ʱ��: 2020-04-01
% ˵��: Majorization-Minimization base phase retrieval algorithm (Random Gauss measurement)
% Revision History: �汾 / �鵵���� / �޸��� / �޸�����
% V1.0 / 2020-04-01 / ֣Ʒ�� / ��������
%----------------------------------------------------------------
clc;clear all
% set parameters
n = 100;        % the length of original signal   
N = 500;        % the length of measurement signal 
t = 10000;       % iterate times
% generate transform matrix A
A = normrnd(0,1,[n,N]);
% generate input x
x = rand(n,1)+1i*rand(n,1);
x = x/norm(x,2);
% calculate output y
y = (abs(conj(A.')*x)).^2;
% calculate minimize object
object = norm(sqrt(y)-abs(conj(A.')*x),2)^2;
disp(['ԭʼ�ź��Ż�Ŀ�����ֵ��',num2str(object)]);
% call MM-based Algorithm
choose = input('ѡ��һ�ָֻ��㷨��\n 1.Gerchberg Saxton Algorithm\n');
switch choose
    case 1
        x_r = Gerchberg_Saxton_Algorithm(A,y,t);
    otherwise
        error('�������룡')
end
% plot figure
figure(1)
plot(1:n,x);hold on
plot(1:n,x_r,'-.');hold off
figure(2)
plot(1:n,angle(x));hold on
plot(1:n,angle(x_r),'-.');hold off