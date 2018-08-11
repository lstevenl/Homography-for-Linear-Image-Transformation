function [] = main()
    im1 = imread('originalImg.jpg');
    im2 = imread('transformedImg.jpg');

    im1 = single(rgb2gray(im1));
    im2 = single(rgb2gray(im2));
    %gather key points from images via keypoint and SIFT 
    [fa, da] = vl_sift(im1) ;
    [fb, db] = vl_sift(im2) ;
    [matches, scores] = vl_ubcmatch(da, db);
    [row,col] = size(matches)
    x1 = [];
    x2 = [];
    for i = 1:col
        index1 = matches(1,i);
        index2 = matches(2,i);
        newPoint1 = [fa(1,index1);fa(2,index1);1];
        newPoint2 = [fb(1,index2);fb(2,index2);1];
        
        x1 = [x1 newPoint1];
        x2 = [x2 newPoint2];
 
    end
    

    

   % [x1 , y1] = ginput (8);
   % P1 = [x1 , y1 ]';
   % [x2 , y2 ] = ginput (8);
   % P2 = [ x2 , y2 ]';
    %save ('pairs.mat' , 'im1' , 'P1' , 'im2' , 'P2')
    %load 'pairs.mat'
    H = homography2d(x1, x2);
    T21 = maketform ('projective' , H');
    im21 = imtransform ( im2 , T21 );
    figure , imshow ( im21 )
    figure , imshow ( im1 )

end