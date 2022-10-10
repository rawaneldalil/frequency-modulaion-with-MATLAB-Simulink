%% Generation of the Message Signal

T = 0:0.0005:2;
Pt_A_Msg_Sig = zeros(length(T));

for i = 1:length(T)
    if T(i) < 0.5
        Pt_A_Msg_Sig(i) = -2*T(i);
    elseif (0.5 < T(i)) && (T(i) < 1.5) 
        Pt_A_Msg_Sig(i) = -2*T(i) + 2;
    elseif (1.5 < T(i)) && (T(i) < 2)
        Pt_A_Msg_Sig(i) = -2*T(i) + 4;
    end
end
figure

plot(T, Pt_A_Msg_Sig)
title('Generated Message Signal')
xlabel('Time') 
ylabel('Message Signal')
%% Generation of the Phase Deviation Signal

% The integration of the message signal is calculated manually, and the generation of the phase
%deviation signal is as follows.

K_f = 5000;
Phase_Dev_Sig = zeros(length(T));

for i = 1:length(T)
    if T(i) < 0.5
        Phase_Dev_Sig(i) = -2*pi*K_f*T(i)^2;
    elseif (0.5 < T(i)) && (T(i) < 1.5) 
        Phase_Dev_Sig(i) = -2*pi*K_f*T(i)^2 + 2*2*pi*K_f*T(i);
    elseif (1.5 < T(i)) && (T(i) < 2)
        Phase_Dev_Sig(i) = -2*pi*K_f*T(i)^2 + 4*2*pi*K_f*T(i);
    end
end
figure
plot(T, Phase_Dev_Sig)
title('Generated Phase Deviation Signal')
xlabel('Time') 
ylabel('Phase Deviation Signal')
%% Generation of the Frequency-modulated Signal

% The carrier signal c(T) = cos(2*pi*10000*T + Theta(T))

Omega_c = 2*pi*10000;
Carrier_theta =  (Omega_c*T) + Phase_Dev_Sig;

FM_Sig = cos(Carrier_theta);
figure 
plot(T', FM_Sig(:,1))

title('Generated Frequency-modulated Signal')
xlabel('Time') 
ylabel('Frequency-modulated Signal')





