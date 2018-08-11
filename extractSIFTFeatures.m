function [] = main()
    im1 = imread('originalImg.jpg');
    im2 = imread('transformedImg.jpg'); 
    sigma_orig  = 1;
    num_octaves = 3;
    num_scales = 2;
    r = 10;
    k1 = [];
    k2 = [];
    
    %gather key points from images via keypoint and SIFT 
    k1 = SIFT(im1, sigma_orig, num_octaves, num_scales, r);
    k2 = SIFT(im2, sigma_orig, num_octaves, num_scales, r);
end