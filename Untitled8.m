h1=figure;
figure(h1);
surf(r_mult_microm*rx,r_mult_microm*ry,abs(Psi(:,:,Nz/2)).^2);
ax = gca;
ax.FontSize=20;
ax.LabelFontSizeMultiplier = 2.5;
ax.TickLabelInterpreter='latex'; 
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
xlabel('$x, \mu$m','FontSize',20,'Interpreter','latex');
ylabel('$y, \mu$m','FontSize',20,'Interpreter','latex');
zlabel('$|\Psi|^2$','FontSize',20,'Interpreter','latex');
title(['$N=$',num2str(NN0)],'FontSize',20,'Interpreter','latex');
