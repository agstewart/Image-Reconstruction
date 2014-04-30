classdef ScanPatient
    %UNTITLED6 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        radius;
        dr_x;
        dr_y;
        theta = degtorad(linspace(0,360,100));
    end
    
    methods
        %constructor
        function obj = ScanPatient(r)
            obj.radius = r;
            obj.dr_x = obj.radius*cos(obj.theta);
            obj.dr_y = obj.radius*sin(obj.theta);
        end
    end
    
end

