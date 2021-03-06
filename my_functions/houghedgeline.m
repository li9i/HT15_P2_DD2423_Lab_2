function [linepar acc] = houghedgeline(pic, scale, gradmagnthreshold, ...
  nrho, ntheta, nlines, verbose)

  % Extract edges from pic
  curves = edgecurves(pic, scale, gradmagnthreshold, 'same', verbose);

  % Get the gradient image from pic
  % No need for smoothing since function edgecurves handles it
  lv = sqrt(Lv(pic, 2));

  if verbose > 0
    figure
    overlaycurves(pic, curves);

    figure
    showgrey(lv);
  end

  % Run houghline
  [linepar acc] = ...
    houghline(curves, lv, nrho, ntheta, gradmagnthreshold, nlines, verbose);

end
