function Irot = rotate_image(I,angle)
 % 
 %   This function takes an image I and creates a new version of the image
 %   which is rotated by amount angle
 %
 % arguments:
 %
 %   I - the original grayscale image, stored as a matrix
 %   angle - the amount by which to rotate the image counter-clockwise, in degrees
 %
 % return value:
 %   
 %   Irot - an image which containing the rotated original
 % 
 
 % find the dimensions of the image matrix
 [height, width] = size(I);
 
 % calculate relative x,y coordinate range
 x_range = rel_coords(width);
 y_range = rel_coords(height);
   
 % compute x,y coordinates of the image
 [xcoord,ycoord] = meshgrid(x_range, y_range);
 
 % Error check xcoord and ycoord size
 if size(xcoord) ~= size(I)
     error('Meshgrid failed to create xcoord same size as X.');
 end
 if size(ycoord) ~= size(I)
     error('Meshgrid failed to create ycoord same size as X.');
 end
 % reshape the image matrix and the 
 X = [xcoord(:) ycoord(:)]';
 Xrot = rotate(X, -angle);
 Ivector = I(:)';
 
 % find max and min x and y coordinates in Xrot
 min_coord = round(min(Xrot'));
 max_coord = round(max(Xrot'));
 xmin = min_coord(1); ymin = min_coord(2);
 xmax = max_coord(1); ymax = max_coord(2);
 
 
 % generate coordinates for pixels in new image
 [newxcoord,newycoord] = meshgrid(xmin:xmax,ymin:ymax);

 % generate rotated image
 Irot = griddata(Xrot(1,:),Xrot(2,:),Ivector,newxcoord(:),newycoord(:));
 Irot = reshape(Irot, size(newxcoord));
end