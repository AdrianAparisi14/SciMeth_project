close all
clc
clear

fruitlist = ["Banana", "Apple", "Mandarine", "Kiwi"];
% fruitlist = ["Banana"]

for ifruit = 1:size(fruitlist, 2)
    fruit = fruitlist(ifruit);
    week1csvfiles = dir(fullfile('./data/', "*" + fruit + "*W1.csv"));
    week2csvfiles = dir(fullfile('./data/', "*" + fruit + "*W2.csv"));

    week1data = formatfruit(week1csvfiles);
    week2data = formatfruit(week2csvfiles);

    % [bestindex1, bestindex2] = findbest(week1data, week2data);

    % ripedata = week1data(:,bestindex1);
    % overdata = week2data(:,bestindex2);

    ripedata = [week1data(:, 1); week1data(:, 2)];
    overdata = [week2data(:, 1); week2data(:, 2)];

    disp("==================================================")
    disp("For: " + fruit)
    disp("==================================================")

    ttestfruit(ripedata, overdata);

    % figure(ifruit)

    figure(1)
    subplot(2,2,ifruit)

    hold on
    histogram(ripedata, 5)
    title("distribution of ripe " + fruit)

    histogram(overdata, 5)
    xl = xline([mean(ripedata), mean(overdata)], '-.', {"Mean of Ripe " + fruit, "Mean of Overripe " + fruit});

    if (fruit == "Apple")

    xl(1).LabelVerticalAlignment = 'middle';
    xl(1).LabelHorizontalAlignment = 'right';
    xl(2).LabelVerticalAlignment = 'middle';
    xl(2).LabelHorizontalAlignment = 'left';

    else
    xl(1).LabelVerticalAlignment = 'middle';
    xl(1).LabelHorizontalAlignment = 'center';
    xl(2).LabelVerticalAlignment = 'middle';
    xl(2).LabelHorizontalAlignment = 'center';
    end
    % title("distribution of overripe " + fruit)

    legend("Ripe " + fruit, "Overripe " + fruit)

    hold off

    % saveas(gcf,'export/' + fruit + '_Histogram.bmp')

    saveas(gcf,'export/Combined_Histogram.bmp')

end

% cleandata = formatfruit(rawdata);
