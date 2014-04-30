classdef DetectorRing
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        radius;
        dr_x;
        dr_y;
        theta = degtorad(0:1:360);
    end
    
    methods
        function obj = DetectorRing(r)
            obj.radius = r;
            obj.dr_x = obj.radius*cos(obj.theta);
            obj.dr_y = obj.radius*sin(obj.theta);
        end
    end
end

