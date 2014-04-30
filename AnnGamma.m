classdef AnnGamma
    %   Class containing properties of a pair of annihilation gammas
    %   Detailed explanation goes here
    
    properties (Constant)
        R = 5; % Radius of Detector Ring
        mo = 9.109E-31; % Mass of electron
        c = 2.99E8; % Speed of light
        e = 511E3; %Gamma energy (511keV)
    end
        
    properties
        origin = zeros(1,2); % origin of gamma pair
        xcoor_1; % x coor of gamma 1
        ycoor_1; % y coor of gamma 1
        xcoor_2; % x coor of gamma 2
        ycoor_2; % y coor of gamma 2
        m_1; % gradient of path of gamma 1 
        c_1; % c of path of gamma 1
        m_2; % gradient of path of gamma 2
        c_2; % c of path of gamma 2
        path1 = zeros(21,2); % Gamma 1 path
        path2 = zeros(21,2); % Gamma 2 path
        rand_theta; % Randomly gemerated angle
        electron_restmass; % Electron Rest Mass Energy
        energy_scatter; % Energy of gamma after scattering
        scattered; % Boolean: True if gamma scatters
    end
    
    methods
        % class constructor
        function obj = AnnGamma(psource)
            
            obj.electron_restmass = (obj.mo*(obj.c)^2)*(1/1.602E-19); % Calculate rest mass of electron
            
            obj.rand_theta = rand(1,1)*180;  % randomly generate angle of direction 
            
            if psource == 1 % if using point source
                obj.origin = [0, 0]; % Set origin as [0,0]
            else
                obj.origin = [0.1*randn(1,1), 0.1*randn(1,1)]; % Randomly generate gamma origin
            end
                
            % Gamma 1
            obj.xcoor_1 = obj.R*cos(degtorad(obj.rand_theta));
            obj.ycoor_1 = obj.R*sin(degtorad(obj.rand_theta)); 
            obj.m_1 = (obj.ycoor_1 - obj.origin(1,2))/(obj.xcoor_1 - obj.origin(1,1));
            obj.c_1 = obj.ycoor_1 - obj.m_1*obj.xcoor_1;
            
            g1_x_lor = 0:obj.xcoor_1/20:obj.xcoor_1; % Gamma 1 LOR x values
            g1_y_lor = g1_x_lor*obj.m_1 + obj.c_1; % Gamma 1 LOR y values
            
            obj.path1(:,1) = g1_x_lor;
            obj.path1(:,2) = g1_y_lor;
            
            % Gamma 2 (Gamma 2 can scatter. Assume scattering occurs at origin)
            scatter = rand(1);
            if scatter < 0.5
               
                obj.scattered = 1;
                
                scatter_theta = deg2rad(rand(1,1)*180); 
                
                obj.energy_scatter = obj.e/(1 + ((obj.e)/(obj.electron_restmass))*(1 - cos(scatter_theta)));
                
                obj.xcoor_2 = obj.R*cos(degtorad(obj.rand_theta + 180 + scatter_theta));
                obj.ycoor_2 = obj.R*sin(degtorad(obj.rand_theta + 180 + scatter_theta)); 
                obj.m_2 = (obj.ycoor_2 - obj.origin(1,2))/(obj.xcoor_2 - obj.origin(1,1));
                obj.c_2 = obj.ycoor_2 - obj.m_2*obj.xcoor_2;

                g2_x_lor = 0:obj.xcoor_2/20:obj.xcoor_2; % Gamma 2 path x values
                g2_y_lor = g2_x_lor*obj.m_2 + obj.c_2; % Gamma 2 path y values

                obj.path2(:,1) = g2_x_lor; %Gamma path x coordinates
                obj.path2(:,2) = g2_y_lor; %Gamma path y coordinates
            else
                obj.xcoor_2 = obj.R*cos(degtorad(obj.rand_theta + 180));
                obj.ycoor_2 = obj.R*sin(degtorad(obj.rand_theta + 180)); 
                obj.m_2 = (obj.ycoor_2 - obj.origin(1,2))/(obj.xcoor_2 - obj.origin(1,1));
                obj.c_2 = obj.ycoor_2 - obj.m_2*obj.xcoor_2;

                g2_x_lor = 0:obj.xcoor_2/20:obj.xcoor_2; % Gamma 2 path x values
                g2_y_lor = g2_x_lor*obj.m_2 + obj.c_2; % Gamma 2 path y values

                obj.path2(:,1) = g2_x_lor; %Gamma path x coordinates
                obj.path2(:,2) = g2_y_lor; %Gamma path y coordinates
           end
        end
        
    end
end

