%----------------------------------------------------------------
% ����: MM_PhaseRetrieval_DFT.m
% ����: ֣Ʒ��
% ʱ��: 2020-04-01
% ˵��: Majorization-Minimization base phase retrieval algorithm (DFT measurement)
% Revision History: �汾 / �鵵���� / �޸��� / �޸�����
% V1.0 / 2020-04-01 / ֣Ʒ�� / ��������
%----------------------------------------------------------------
clc;clear all
% set parameters
n = 100;        % the length of original signal   
N = 500;        % the length of measurement signal 
t = 10000;      % iterate times
% generate transform matrix A
A = fft(eye(N));
A = conj(A.');
A = A(1:n,:);
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
% calculate autocorrelation sequences
ac_x = xcorr(x);
ac_xr = xcorr(x_r);
% plot figure
figure(1) 
subplot(2,1,1)
plot(1:2*n-1,abs(ac_x),'-k','LineWidth',1);hold on
plot(1:2*n-1,abs(ac_xr),'--r','LineWidth',1);hold off
legend('ԭʼ�ź���������з�ֵ','�ָ��ź���������з�ֵ');
title('�źŷ�ֵ');
subplot(2,1,2)
plot(1:2*n-1,angle(ac_x),'-k','LineWidth',1);hold on
plot(1:2*n-1,angle(ac_xr),'--r','LineWidth',1);hold off
legend('ԭʼ�ź������������λ','�ָ��ź������������λ');
title('�ź���λ');