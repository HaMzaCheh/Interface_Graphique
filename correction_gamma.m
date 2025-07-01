function img_f = correction_gamma(img, gamma)

    img_f = double(img) / 255;

    img_f = 255 * (img_f .^ gamma);

    img_f = uint8(img_f);
end
