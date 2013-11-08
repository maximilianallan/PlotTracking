function [ x_plot, y_plot, z_plot ] = PlotTracking( tracking_data, ground_truth_data )
%PlotTracking Visualize the results of 3D pose tracking
%   Pass 2 [NxM] arrays to the function where N is the number of frames of
%   tracking data (each row should represent the pose estimated at the n^th
%   frame) and M is the dimensionality of the pose. This should be:
%       
%       [Tx,Ty,Tz,R1,R2,R3] 
%
%   where the rotations should be computed from a rotation matrix using 
%   Rodrigues' formula.

if size(tracking_data) ~= size(ground_truth_data)
    error('Error, the matrices passed are not the same size.');
end

x_plot = MakePlot( 1:size(tracking_data,1) , ...
              { tracking_data(:,1), ground_truth_data(:,1) }, ...
              { 'Our algorithm' , 'Ground Truth' }, ...
              'Plot of X Pose', ...
              'X Coordinate (mm)'...
              );
                
saveas(x_plot,'x.pdf');

y_plot = MakePlot( 1:size(tracking_data,1) , ...
              { tracking_data(:,2), ground_truth_data(:,2) }, ...
              { 'Our algorithm' , 'Ground Truth' }, ...
              'Plot of Y Pose', ...
              'Y Coordinate (mm)'...
              );

saveas(y_plot,'y.pdf');

z_plot = MakePlot( 1:size(tracking_data,1) , ...
              { tracking_data(:,2), ground_truth_data(:,2) }, ...
              { 'Our algorithm' , 'Ground Truth' }, ...
              'Plot of Y Pose', ...
              'Y Coordinate (mm)'...
              );

saveas(z_plot,'z.pdf');

end

function [h] = MakePlot(x_range, y_ranges, legend_labels, plot_title, y_label )

if ~iscell(x_ranges) | ~iscell(legend_labels) | size(y_ranges,2) ~= size(legend_labels,2)
    error('Error, the inputs to MakePlot are different sizes.');
end

h = figure;
hold on;
title(plot_title);
xlabel('Frame');
ylabel(y_label);
box;

for plt = (1:size(y_ranges,2))
 
    plot(h,x_range,y_ranges(plt));
    legend(h,legend_labels(plt));    
    
end


end

