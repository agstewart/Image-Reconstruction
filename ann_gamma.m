classdef AnnGamma
    %   Class containing properties of a pair of annihilation gammas
    %   Detailed explanation goes here
    
    properties (Constant)
        R;
        origin; % origin of gamma pair
        rand_theta;
        x_coor;
        y_coor;
    end
        
    properties (Dependent)   
    end
    
    methods
        function AG = AnnGamma()
            R = 1;
            origin = [0,0];
            rand_theta = rand(1);
            x_coor = cos(degtorad(rand_theta*360)); % randomly generate angle of direction 
            y_coor = sin(degtorad(rand_theta*360)); 
        end
    end
    
end

