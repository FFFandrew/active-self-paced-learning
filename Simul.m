% %%
function [t,x]=Simul(ufunc,tspan,x0,deta)
% % 功能：前向Euler法求解微分方程
% % 输入参数：微分方程组的函数名称ufun，时间起点终点tspan,初始值x0，步长h
% % 输出参数：时间序列t，状态序列x，内部动态变量eta,能量函数序列V,增广能量函数序列W
% if nargin<4 % 输入参数个数
%     h=0.01;
% end
% x0 = [1;2;3;4;5;6;7;8];  % 初始状态
global u;
if size(tspan)==[1,2]
     t0=tspan(1);
     tn=tspan(2);
% else
%     error(message('MATLAB:Euler:WrongDimensionOfTspan'));
end
n=floor((tn-t0)/deta); % 求步数
t(1)=t0; % 时间起点
%A(:,j)第j列，A(i,:)第i行
x(:,1)=x0;
% P=[1 0.25;0.25 1];
% V(:,1)=x0'*P*x0; % 能量函数
% W(:,1)=x0'*P*x0; % 增广能量函数
% eta=0; % 内部动态变量初值

for i=1:n
t(i+1)=t(i)+deta;
if t<2
[dx]=ufunc(t(i),x(:,i),x0);

x(:,i+1)=x(:,i)+deta*dx;
u=[u,dx];
else
x(:,i+1)=x(:,i);
u=[u,[0;0;0;0;0;0;0;0]];
%   V(:,i+1)=x(:,i+1)'*P*x(:,i+1);
%   eta(:,i+1)=eta(:,i)+h*deta; % 内部变量的演化
%   W(:,i+1)=x(:,i+1)'*P*x(:,i+1)+eta(:,i+1);
end

end

