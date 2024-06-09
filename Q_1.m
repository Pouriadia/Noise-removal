clc; clear; close all

original_pepper = imread("Pepper.bmp");
original_cameraman = imread("Cameraman.bmp");
original_barbara = imread("Barbara.bmp");
original_baboon = imread("Baboon.bmp");

iterations = 20;

noisy_pepper = imnoise(original_pepper, 'salt & pepper', 0.9);
med_pepper = medfilt2(noisy_pepper, [3 3]);
my_pepper = removal(noisy_pepper, 3, iterations);
noisy_cameraman = imnoise(original_cameraman, 'salt & pepper', 0.9);
med_cameraman = medfilt2(noisy_cameraman, [3 3]);
my_cameraman = removal(noisy_cameraman, 3, iterations);
noisy_barbara = imnoise(original_barbara, 'salt & pepper', 0.9);
med_barbara = medfilt2(noisy_barbara, [3 3]);
my_barbara = removal(noisy_barbara, 3, iterations);
noisy_baboon = imnoise(original_baboon, 'salt & pepper', 0.9);
med_baboon = medfilt2(noisy_baboon, [3 3]);
my_baboon = removal(noisy_baboon, 3, iterations);

pepper_psnr = psnr(original_pepper, med_pepper);
cameraman_psnr = psnr(original_cameraman, med_cameraman);
barbara_psnr = psnr(original_barbara, med_barbara);
baboon_psnr = psnr(original_baboon, med_baboon);

[pepper_psnr
 cameraman_psnr
 barbara_psnr
 baboon_psnr
 ((pepper_psnr + cameraman_psnr + barbara_psnr + baboon_psnr) / 4)]