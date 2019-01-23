function [] = mcpa()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

   global C

    addpath ../geom2d/geom2d

    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                    % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665; %metres (32.1740 ft) per s²

    MaxC = 500;
    V0 = 0;
    g = 1;
    dt = 1;
    x = 0;
    k = 100;
    Vx = V0 ;
    Vk = 2;


        for c=1:MaxC
            
            %plotting the electron
            xlim([0 500])
            ylim([0 10e4])
            scatter(c, x, 'o', 'r');
            grid on
            hold on
            pause(0.03)
            %updating the velocity and position
            dvx = C.g*dt;
            prob = rand();
            if (prob <= 0.05)
                Vx =0;
                dx = 0;
            else
                Vx = Vx + dvx;
                dx = Vx * dt;
            end
            x = x + dx;
            
            subplot(1,1,1);
            scatter(c, Vx, 'o','b')

            
            subplot(1,1,1)
            scatter(c, k, 'o','g')
            dvk = 2*C.g*dt;
            prob = rand();
            if (prob <= 0.2)
                Vk =0;
                dk = 0;
            else
                Vk = Vk + dvk;
                dk = Vk * dt;
            end
            k = k + dk;
            str = sprintf('Drift Velocity is %d and %d', Vx, Vk);
            title(str)
        end
end

