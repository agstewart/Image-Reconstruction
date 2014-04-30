classdef ForwGrid
    %ForwGrid: Generates pixel grid 
    %   Detailed explanation goes here
    
    properties (Constant)
%         xstep = 0.1;
%         ystep = 0.1;
    end
    
    properties
        xstep;
        ystep
        x;
        y;
        x2;
        y2;
    end
    
    methods
        % Class constructor
        function obj = ForwGrid(xStep, yStep)
            obj.xstep = xStep;
            obj.ystep = yStep;
            obj.x = -5:obj.xstep:5;
            obj.y = -5:obj.ystep:5;
            k = [-1*obj.xstep/2, obj.xstep/2, obj.xstep/2, -1*obj.xstep/2]; 
            [X Y] = meshgrid(k, obj.x);
            obj.x2 = X + Y; 

            h = [-1*obj.ystep/2, -1*obj.ystep/2, obj.ystep/2, obj.ystep/2];
            [X2 Y2] = meshgrid(h, obj.y);
            obj.y2 = X2 + Y2;
        end
    end
    
end

