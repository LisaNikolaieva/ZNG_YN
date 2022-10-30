Nc = NN0;
Nt = 0;
exp_mu_old = 0;

eps = 1e-6;
delta = 1;


%% Initializing
mu_TF=16;
rho_TF=(mu_TF-V)/g.*(mu_TF>=V);
Psi=sqrt(rho_TF).*exp(1i*s0*atan2(Y,X)).*exp(1i*s1*atan2(Y,(X-0.5*(R_i+R_o)))).*exp(1i*s2*atan2(Y,(X+0.5*(R_i+R_o))));
Psi = Psi.*sqrt(NN0/((sum(sum(sum(abs(Psi).^2))))*dV));   
nt = Psi*0;


i = 1;

%% Main cycle
while (delta > eps)
    I(i)=i;
    FRACT(i)=Nc/(Nc+Nt);
    
    Psi = ifftn(eD_hp_itp.*fftn(Psi));
    Psi = exp(-(V+g*(abs(Psi)).^2+2*g*nt)*dt_itp).*Psi;
    Psi = ifftn(eD_hp_itp.*fftn(Psi));
    
    
    %% Some iterations without thermal cloud
    if(T > 0 && mod(i,10) == 1 ) % for better performance and stability we do some initial iterations without a thermal cloud
        Nt = sum(sum(sum(nt)))*dV;
        Nc = NN0 - Nt;
        if(Nc < 1)
            Nc = 1;
            nt = nt*NN0/Nt; % we need to get the correct total number of particles even above Tc
        end
    end
    
    %% mu
    exp_mu = sqrt(Nc/(sum(sum(sum(abs(Psi).^2)))*dV));
    C(i) = gather(exp_mu);

    Psi=Psi*exp_mu;
	
    
muF=sum(sum(sum((ifftn(0.5*kk.*fftn(Psi))+(V + g*abs(Psi).^2 + 2*g*nt).*Psi).*conj(Psi))))/sum(sum(sum(abs(Psi.^2))));
MU(i) = gather(muF);
%MU(i) = log(exp_mu)/dt_itp;
 %I(i)=i;
    
    
    %% Thermal cloud
    if(mod(i,10) == 0)
        
        mmu = min(MU(i),min(min(min(V + 2*g*abs(Psi).^2 + 2*g*nt)))- 10e-41); % compensate for possibly inaccurate chem. pot. calculation
        if(T > 0)
            ntt = (T/(2*pi))^(3/2)*polylog_nt(1.5, exp((mmu - (V + 2*g*abs(Psi).^2 + 2*g*nt))/(T)));
            
            if(Nc <= 1 )
                Nt = sum(sum(sum(ntt)))*dV;
		        nt = (nt+ntt*NN0/Nt)*0.5;
		    else
		        nt=(nt+ntt)*0.5;
		    end
        end
        
        Nt = sum(sum(sum(nt)))*dV;
     
        delta = abs(log(exp_mu_old/exp_mu))/(9*dt_itp^2*mmu);
        exp_mu_old = C(i - 9);

    end
    
    %%
    i=i+1;
    if(i>=10000) 
        warning('Convergence not reached');
        break;
    end
    
    
    
   %% plot
%     figure(h1);
%     h1.Color='k';
%     set(gca,'Color','k');
%     set(gca,'xcolor','[0.55 0.55 0.55]') 
%     set(gca,'ycolor','[0.55 0.55 0.55]') 
%     set(gcf, 'InvertHardCopy', 'off');
%     ax = gca;
%     ax.FontSize=20;
%     ax.LabelFontSizeMultiplier = 2.5;
%     ax.TickLabelInterpreter='latex'; 
%     ax.XMinorTick = 'on';
%     ax.YMinorTick = 'on';
%     ax.Box='on';
%     xlabel('$i$','FontSize',40,'Interpreter','latex');
%     ylabel('$fract$','FontSize',40,'Interpreter','latex');
%     hold on
%     p=plot(I,FRACT,'c.-');
%     p.MarkerSize=15;
    
    
end

mu = MU(end);
DeltaPsi=mu*Psi-(ifftn(0.5*kk.*fftn(Psi))+(V + g*abs(Psi).^2 + 2*g*nt).*Psi);
Deltant=nt-(T/(2*pi))^(3/2)*polylog_nt(1.5, exp((mmu - (V + 2*g*abs(Psi).^2 + 2*g*nt))/(T)));
