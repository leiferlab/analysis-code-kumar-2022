function [] = plot_worm_frame_post_analysis(I, center_lines, centerline_color, centerline_stimulus, debugimage,in_track_index,current_ellipse_ratio)

% % % % % % [] = plot_worm_frame(I, center_lines, centerline_color, UncertainTips, centerline_stimulus, debugimage,in_track_index,current_ellipse_ratio)

%     IWFig = findobj('Tag', ['IWFig', num2str(plotting_index)]);
%     if isempty(IWFig)
%         IWFig = figure('Tag', ['IWFig', num2str(plotting_index)]);
%     else
%         figure(IWFig);
%     end
    %used for debugging
%     hold off;

%     clf
    if nargin > 5
        %debugimage inputted
        I = I * 2;
%         imshow(cat(3, I, I, I) + debugimage./3, [], 'InitialMagnification', 500, 'Border','tight');
        
        imshow(I, [], 'InitialMagnification', 500, 'Border','tight'); hold on;
        if ~isempty(find(debugimage(:,:,1)>10))
            hold on; 
%             text(60, 0, num2str('.'), 'Color', 'r','FontSize',140);
            LEDPower=90;
            [frame_h, frame_w] = size(I);
            plot_x = ceil(frame_w - (frame_w/10));
            plot_y = ceil(frame_h/10);
            plot(plot_x-5, plot_y+4, 'o', 'MarkerSize', 30, 'MarkerEdgeColor','none', 'MarkerFaceColor',[1 0 0]./1)
            text(73,4, [num2str(round(LEDPower)), ' uW/mm^{2}'], 'HorizontalAlignment', 'right', 'VerticalAlignment', 'middle', 'color', 'y', 'fontsize', 12);
        end
    else
        imshow(I, [], 'InitialMagnification', 300, 'Border','tight');
    end
    
    if isempty(centerline_color)
        centerline_color = [1, 1, 0];
    end
    

    hold on
    %head
    plot(center_lines(1,2), center_lines(1,1), '.', 'Color', centerline_color, 'markersize',10)
    plot(center_lines(:,2), center_lines(:,1), '-', 'Color', centerline_color, 'LineWidth',1)
%     if ~isempty(centerline_stimulus)
%         for centerline_point_index = 1:size(center_lines,1)
%             if isnan(centerline_stimulus(centerline_point_index))
%                 dot_color = [0 1 0];
%             elseif centerline_stimulus(centerline_point_index) > 0
%                 dot_color = [centerline_stimulus(centerline_point_index)/255, 0, 0];
%             elseif centerline_stimulus(centerline_point_index) < 0
%                 dot_color = [0,0,-centerline_stimulus(centerline_point_index)/255];
%             else
%                 dot_color = [0 0 0];
%             end
%             plot(center_lines(centerline_point_index,2), center_lines(centerline_point_index,1), '.', 'Color', dot_color, 'markersize',20)
%         end
%     end

% % % % %     %uncertain tips
% % % % %     if ~isempty(UncertainTips) && ~isempty(UncertainTips.Tips)
% % % % %         plot(UncertainTips.Tips(:,2), UncertainTips.Tips(:,1), 'oy')
% % % % %     end
%     %tail
%     plot(center_lines(end,2), center_lines(end,1), 'ob')
% 
%     
    %direction
%     quiver(size(I,2)/2, size(I,1)/2, sind(direction)*speed*100, -cosd(direction)*speed*100, 'AutoScale','off', 'Linewidth', 1.5);
%     %title (['Eccentricity = ', num2str(eccentricity)]);    
%     title (sprintf('Frame=%d, E.R.=%.1f',in_track_index,current_ellipse_ratio));
    %score
    text(10, 10, num2str(in_track_index), 'Color', 'y','FontSize',14);
%     %eccentricity
    text(10, 60, num2str(current_ellipse_ratio,'%4.2f'), 'Color', 'y','FontSize',14);
    
    hold off;
%     drawnow
end