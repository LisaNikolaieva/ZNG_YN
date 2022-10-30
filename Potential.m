%%
wox_ph=38.5*1e-6;                       % m
woy_ph=37.7*1e-6;                       % m
lambda_ph=1070*1e-9;                    % m
U0_ph=-2.0756091564312367*1e-36;        % J*m^2/W
Px_ph=31*1e-3;                        % W=J/s 
Py_ph=31*1e-3;                        % W=J/s   


% wox=wox_ph/r_mult;       
% woy=woy_ph/r_mult;
% lambda=lambda_ph/r_mult;    
% U0=U0_ph/(V_mult*r_mult^2/W_mult);
% Px=Px_ph/W_mult;        
% Py=Py_ph/W_mult;
% 
% xR=pi*wox^2/lambda;
% yR=pi*woy^2/lambda;
% 
% Wx=wox*sqrt(1+X.^2/xR^2);
% Wy=woy*sqrt(1+Y.^2/yR^2);
% 
% I=2*Px/(pi*Wx.^2).*exp(-2*(Y.^2+Z.^2)./(Wx.^2))+...
%   2*Py/(pi*Wy.^2).*exp(-2*(X.^2+Z.^2)./(Wy.^2));
% 
% V1=U0*I;
% V=V1-min(min(min(V1)));
%%
% h1=figure;
% figure(h1);
% surf(r_mult_microm*rx,r_mult_microm*ry,V_mult*V(:,:,Nz/2));
% ax = gca;
% ax.FontSize=20;
% ax.LabelFontSizeMultiplier = 2.5;
% ax.TickLabelInterpreter='latex'; 
% ax.XMinorTick = 'on';
% ax.YMinorTick = 'on';
% xlabel('$x, \mu$m','FontSize',20,'Interpreter','latex');
% ylabel('$y, \mu$m','FontSize',20,'Interpreter','latex');
% zlabel('$V$, J','FontSize',20,'Interpreter','latex');





%%
 V=0.5*(X.^2 + Y.^2+kappa^2*Z.^2);



%%
% w1=1; %wi=omega_i/omega_r
% w2=1;
% w3=1;
% 
% V1=(w1)^2*0.5*((sqrt(X.^2+Y.^2)-R_i).^2).*((X.^2+Y.^2)<R_i^2);
% V2=(w2)^2*0.5*min((sqrt(X.^2+Y.^2)-R_i).^2,(sqrt(X.^2+Y.^2)-R_o).^2).*((X.^2+Y.^2)<R_o^2).*((X.^2+Y.^2)>R_i^2);
% V3=(w3)^2*0.5*((sqrt(X.^2+Y.^2)-R_o).^2).*((X.^2+Y.^2)>R_o^2);
% 
% Vr=V1+V2+V3;
% Vz=0.5*kappa^2*Z.^2;
% 
% V=Vr+Vz;


%%
if DO_PARALLEL
    V = gpuArray(V);
end
