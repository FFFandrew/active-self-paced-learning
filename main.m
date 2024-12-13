%mian

 clc; clear; 
clear global ;
% close all;
% 
% %% 初始化条件
deta = 0.001;  % 仿真步长
% %x0 = [10*cos(2*pi/30); 10*sin(2*pi/30)];  % 初始状态
%x0 = [1;2;3;4;5;6;7;8]; % 初始状态
x0 = [1.5;2.5;2;3.5;5.6;5.2;6.3;7.6]; % 初始状态 这个窃听效果最好
% x0 = [3;4.2;1.2;5.8;3.5;7.8;6;6.2];
% x0=8*rand(8,1);
% x0
 % x0 =[7.6601;7.7191;1.2609;7.7647;7.6573;3.8830;6.4022;1.1351];


% x0=[1;2;3;4;5]; % 初始状态
setGlobalx(x0); 
global trigger_times_1;
global trigger_times_2;
global trigger_times_3;
global trigger_times_4;
global trigger_times_5;
global trigger_times_6;
global trigger_times_7;
global trigger_times_8;
global u;

% %global x1;
% x1(1)=1;
% 动态事件触发时刻
trigger_times_1(1)=0;
trigger_times_2(1)=0;
trigger_times_3(1)=0;
trigger_times_4(1)=0;
trigger_times_5(1)=0;
trigger_times_6(1)=0;
trigger_times_7(1)=0;
trigger_times_8(1)=0;
% sigma=0.1; kappa=0.48;
% P=[1 0.25;0.25 1];
% 
% %% 动态事件触发控制
setGlobalx(x0); % 重置状态初值
[t,x_Dyn] = Simul(@ET,[0 2.5],x0,deta);     % Euler法 事件触发控制仿真
% [tf_Dyn,index_Dyn]=ismember(trigger_times_Dyn,t);
[tf1,index1]=ismember(trigger_times_1,t);
xtrigger_times_1=x_Dyn(1,index1);
[tf2,index2]=ismember(trigger_times_2,t);
xtrigger_times_2=x_Dyn(2,index2);
[tf3,index3]=ismember(trigger_times_3,t);
xtrigger_times_3=x_Dyn(3,index3);
[tf4,index4]=ismember(trigger_times_4,t);
xtrigger_times_4=x_Dyn(4,index4);
[tf5,index5]=ismember(trigger_times_5,t);
xtrigger_times_5=x_Dyn(5,index5);
[tf6,index6]=ismember(trigger_times_6,t);
xtrigger_times_6=x_Dyn(6,index6);
[tf7,index7]=ismember(trigger_times_7,t);
xtrigger_times_7=x_Dyn(7,index7);
[tf8,index8]=ismember(trigger_times_8,t);
xtrigger_times_8=x_Dyn(8,index8);
% Vt_Dyn=V_Dyn(index_Dyn); % 动态事件触发时刻能量
% %% 绘图
%节点收敛的图
%各节点触发时间的图
xend=x_Dyn(:,2501);
% figure(1);
% plot(t,x_Dyn(1,:),'r-',t,x_Dyn(2,:),'k-',t,x_Dyn(3,:),'g-',t,x_Dyn(4,:),'y-',t,x_Dyn(5,:),'b-',t,x_Dyn(6,:),'r--',t,x_Dyn(7,:),'m-',t,x_Dyn(8,:),'c-')
% 
% xlabel('时间 t/s');
% ylabel('x_{i}(t)');
% % title
% legend('x_1','x_2','x_3','x_4','x_5','x_6','x_7','x_8','FontSize',10,'Orientation','horizontal','NumColumns',2)
% 
% set(gcf,'color','w')
% set(gca, 'Fontsize', 12);


% figure(2);
% plot(t,x_Dyn(1,:)-xend(1,1),'r-',t,x_Dyn(2,:)-xend(2,1),'k-',t,x_Dyn(3,:)-xend(3,1),'g-',t,x_Dyn(4,:)-xend(4,1),'y-',t,x_Dyn(5,:)-xend(5,1),'b-',t,x_Dyn(6,:)-xend(6,1),'r--',t,x_Dyn(7,:)-xend(7,1),'m-',t,x_Dyn(8,:)-xend(8,1),'c-')
% 
% xlabel('时间 t/s');
% ylabel('x_{i}(t)-x^*');
% % title
% legend('x_1-x^*','x_2-x^*','x_3-x^*','x_4-x^*','x_5-x^*','x_6-x^*','x_7-x^*','x_8-x^*','FontSize',10,'Orientation','horizontal','NumColumns',2)
% 
% set(gcf,'color','w')
% set(gca, 'Fontsize', 12);
% u=[u,[0;0;0;0;0;0;0;0]];
% 
% figure(3);
% plot(t,u(1,:),'r-',t,u(2,:),'k-',t,u(3,:),'g-',t,u(4,:),'y-',t,u(5,:),'b-',t,u(6,:),'r--',t,u(7,:),'m-',t,u(8,:),'c-')
% 
% xlabel('时间 t/s');
% ylabel('u_{i}(t)');
% % title
% legend('u_1','u_2','u_3','u_4','u_5','u_6','u_7','u_8','FontSize',10,'Orientation','horizontal','NumColumns',2)
% 
% set(gcf,'color','w')
% set(gca, 'Fontsize', 12);
% 
% 
% figure(4)
% % plot(t,x_Dyn(1,:),'r-',t,x_Dyn(2,:),'k-',t,x_Dyn(3,:),'g-',t,x_Dyn(4,:),'y-',t,x_Dyn(5,:),'b-',t,x_Dyn(6,:),'r--',t,x_Dyn(7,:),'m-',t,x_Dyn(8,:),'c-')
% % hold on;
% % scatter(trigger_times_1,xtrigger_times_1,'red','*')
% % hold on;
% % scatter(trigger_times_2,xtrigger_times_2,'k','*')
% % scatter(trigger_times_3,xtrigger_times_3,'g','*')
% % scatter(trigger_times_4,xtrigger_times_4,'y','*')
% % scatter(trigger_times_5,xtrigger_times_5,'b','*')
% % scatter(trigger_times_6,xtrigger_times_6,'red','*')
% % scatter(trigger_times_7,xtrigger_times_7,'m','*')
% % scatter(trigger_times_8,xtrigger_times_8,'cyan','*')
% % scatter(trigger_times_1,1,'red','*',trigger_times_2,2,'k','x',trigger_times_3,3,'g','x',trigger_times_4,4,'y','x',trigger_times_5,5,'b','x',trigger_times_6,6,'red','x',trigger_times_7,7,'m','x',trigger_times_8,8,'cyan','x')
% 
% A=scatter(trigger_times_1,1,'red','*');
% 
% hold on
% B=scatter(trigger_times_2,2,'k','x');
% C=scatter(trigger_times_3,3,'g','x');
% D=scatter(trigger_times_4,4,'y','x');
% E=scatter(trigger_times_5,5,'b','x');
% F=scatter(trigger_times_6,6,'red','x');
% G=scatter(trigger_times_7,7,'m','x');
% H=scatter(trigger_times_8,8,'cyan','x');
% axis([0 2.7 0 9])
% hold off
% 
% xlabel('时间 t/s');
% ylabel('节点 i');
% % title
% legend([A(1) B(1) C(1) D(1) E(1) F(1) G(1) H(1)],{'node1','node2','node3','node4','node5','node6','node7','node8'},'FontSize',10,'Orientation','horizontal','NumColumns',1)



% % legend(A,'agent1')
% % hold on
% % legend(B,'agent2')
% box on
% set(gcf,'color','w')
% set(gca, 'Fontsize', 12);
% %plot(t, x_Dyn)   % 系统状态
% % legend('$x_1$','$x_2$','Interpreter','Latex','Fontsize',11);
% % xlabel('time(s)');
% % figure(2)
% % plot(t, V_Dyn, 'b','Linewidth',1.2)   % 能量函数
% % hold on;
% % plot(t, W,'Color',[0.9 0 0]);
% % plot(t, Vfun,'--','Color',[0 0.9 0]);
% %plot(trigger_times_1,x_Dyn(1,:))
% % legend('V(x(t))','W(x(t),\eta(t))','V(x(0))e^{(\sigma-1)\kappa t}','Execution times','Fontsize',11);