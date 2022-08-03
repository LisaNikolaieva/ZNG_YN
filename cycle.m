Config;
% h1=figure('visible', 'on',  'Position', [50 -50 2000 1000]);
%  h2=figure('visible', 'on',  'Position', [50 -50 2000 1000]);

T_ph=100*1e-9;
T=T_ph/T_mult;                     % dimensionless temperature


j=0;
for NN0=1e3*25%(1:10:10000)
    j=j+1;
   
    itp;
    
    TEMPERATURE(j)=T;
    NC(j)=Nc;
   
    
    
    %%
%     figure(h2);
%     ax = gca;
%     ax.FontSize=20;
%     ax.LabelFontSizeMultiplier = 2.5;
%     ax.TickLabelInterpreter='latex'; 
%     ax.XMinorTick = 'on';
%     ax.YMinorTick = 'on';
%     ax.Box='on';
%     xlabel('$T, nK$','FontSize',40,'Interpreter','latex');
%     ylabel('$N_c/N$','FontSize',40,'Interpreter','latex');
%     hold on
%     p=plot(TEMPERATURE*T_mult*1e9,NC./NN0,'.-');
%     p.MarkerSize=15;
%   
%     
end


Pic;