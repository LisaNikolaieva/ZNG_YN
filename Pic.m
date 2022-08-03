h1=figure;
figure(h1);
Psi=gather(Psi);
nt=gather(nt);
V=gather(V);
Nc=abs(Nc);
Nt=abs(Nt);
%%
subplot(2,3,1)
s1=surf(r_mult_microm*rx,r_mult_microm*ry,V_mult*V(:,:,Nz/2));
s1.EdgeColor='none';
ax = gca;
ax.FontSize=16;
ax.LabelFontSizeMultiplier = 2.5;
ax.TickLabelInterpreter='latex'; 
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.Box='on';
xlim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);
ylim([-Ly/2*r_mult_microm,Ly/2*r_mult_microm]);
xlabel('$x, \mu$m','FontSize',16,'Interpreter','latex');
ylabel('$y, \mu$m','FontSize',16,'Interpreter','latex');
zlabel('$V,$ J','FontSize',16,'Interpreter','latex');
title(['$T=$ ',num2str(T_ph*1e9),' nK'],'FontSize',20,'Interpreter','latex');



%%
subplot(2,3,2)
s2=surf(r_mult_microm*rx,r_mult_microm*ry,abs(Psi_mult_cm3*Psi(:,:,Nz/2)).^2);
s2.EdgeColor='none';
ax = gca;
ax.FontSize=16;
ax.LabelFontSizeMultiplier = 2.5;
ax.TickLabelInterpreter='latex'; 
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.Box='on';
xlim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);
ylim([-Ly/2*r_mult_microm,Ly/2*r_mult_microm]);
zlim([0 inf])
xlabel('$x, \mu$m','FontSize',16,'Interpreter','latex');
ylabel('$y, \mu$m','FontSize',16,'Interpreter','latex');
zlabel('$|\Psi|^2$, 1/cm$^3$','FontSize',16,'Interpreter','latex');
title(['$N_c=$ ',num2str(Nc,'%.0f')],'FontSize',20,'Interpreter','latex');



%%
subplot(2,3,3)
s2=surf(r_mult_microm*rx,r_mult_microm*ry,Rho_mult_cm3*abs(nt(:,:,Nz/2)));
s2.EdgeColor='none';
ax = gca;
ax.FontSize=16;
ax.LabelFontSizeMultiplier = 2.5;
ax.TickLabelInterpreter='latex'; 
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.Box='on';
xlim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);
ylim([-Ly/2*r_mult_microm,Ly/2*r_mult_microm]);
zlim([0 inf])
xlabel('$x, \mu$m','FontSize',16,'Interpreter','latex');
ylabel('$y, \mu$m','FontSize',16,'Interpreter','latex');
zlabel('$\rho$, 1/cm$^3$','FontSize',16,'Interpreter','latex');

title(['$N_t=$ ',num2str(Nt,'%.0f')],'FontSize',20,'Interpreter','latex');




%%
subplot(2,3,4)
hold on
p41=plot(r_mult_microm*rx,abs(Psi_mult_cm3*Psi(Ny/2,:,Nz/2)).^2,'.-');
p41.MarkerSize=10;
p42=plot(r_mult_microm*rx,Rho_mult_cm3*abs(nt(Ny/2,:,Nz/2)),'.-');
p42.MarkerSize=10;
p43=plot(r_mult_microm*rx,V(Ny/2,:,Nz/2)/max(max(max(abs(V(Ny/2,:,Nz/2)))))*max(max(max(abs(Psi_mult_cm3*Psi(Ny/2,:,Nz/2)).^2))),'-');
p43.LineWidth=2;
ax = gca;
ax.FontSize=16;
ax.LabelFontSizeMultiplier = 2.5;
ax.TickLabelInterpreter='latex'; 
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.Box='on';
xlim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);
ylim([-inf,1.3*max(max(max(abs(Psi_mult_cm3*Psi(Ny/2,:,Nz/2)).^2)))]);

xlabel('$x, \mu$m','FontSize',16,'Interpreter','latex');
ylabel('1/cm$^{3}$','FontSize',16,'Interpreter','latex');
legend('$|\Psi|^2_{y,z=0}$', '$|\rho|_{y,z=0}$','FontSize',10,'Interpreter','latex');




%%
subplot(2,3,5)
hold on
p51=plot(r_mult_microm*rx,abs(Psi_mult_cm3*Psi(Ny/2,:,Nz/2)),'.-');
p51.MarkerSize=10;
p52=plot(r_mult_microm*rx,abs(Psi_mult_cm3*DeltaPsi(Ny/2,:,Nz/2)),'.-');
p52.MarkerSize=10;

ax = gca;
ax.FontSize=16;
ax.LabelFontSizeMultiplier = 2.5;
ax.TickLabelInterpreter='latex'; 
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.Box='on';
xlim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);
ylim([-inf,1.3*max(max(max(abs(Psi_mult_cm3*Psi(Ny/2,:,Nz/2)))))]);
xlabel('$x, \mu$m','FontSize',16,'Interpreter','latex');
ylabel('1/cm$^{3/2}$','FontSize',16,'Interpreter','latex');
legend('$|\Psi|_{y,z=0}$', '$|\Delta \Psi|_{y,z=0}$','FontSize',10,'Interpreter','latex');



%%
subplot(2,3,6)
hold on
p61=plot(r_mult_microm*rx,Rho_mult_cm3*abs(nt(Ny/2,:,Nz/2)),'.-');
p61.MarkerSize=10;
p62=plot(r_mult_microm*rx,Rho_mult_cm3*abs(Deltant(Ny/2,:,Nz/2)),'.-');
p62.MarkerSize=10;

ax = gca;
ax.FontSize=16;
ax.LabelFontSizeMultiplier = 2.5;
ax.TickLabelInterpreter='latex'; 
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.Box='on';
xlim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);
if T>0
ylim([-inf,1.3*max(max(max(Rho_mult_cm3*abs(nt(Ny/2,:,Nz/2)))))]);
end
xlabel('$x, \mu$m','FontSize',16,'Interpreter','latex');
ylabel('1/cm$^{3}$','FontSize',16,'Interpreter','latex');
legend('$|\rho|_{y,z=0}$', '$|\Delta \rho|_{y,z=0}$','FontSize',10,'Interpreter','latex');

