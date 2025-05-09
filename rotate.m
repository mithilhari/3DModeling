function Xrot = rotate(X,angle)
 % function Xrot = rotate(X,angle)
 % 
 %   This function takes a set of points stored in X and
 %   applies a rotation specified by angle.
 %   
 % arguments: 
 %
 %   X :  a 2xN matrix of points where the first row gives the x coordinate
 %        of each point and the second row gives the y coordinate of each point
 %
 %   angle : the amount to rotate counter-clockwise, in degrees
 %
 %
 % return value:
 %  
 %  Xrot : a 2xN matrix containing the rotated points.
 %
 
 % find dimensions of X for error checking
 [row, col] = size(X);
 if row ~= 2
     error('Please input a 2xN matrix');
 end

 angle_rad = pi * (angle/180.0); % degree-radian conversion
 rotation_matrix = [cos(angle_rad) -sin(angle_rad); sin(angle_rad) cos(angle_rad)];
 Xrot = rotation_matrix * X;
end  