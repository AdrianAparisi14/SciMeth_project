fruit = ["Banana", "Apple", "Mandarin", "Kiwi"]

for ifruit = 1:size(fruit, 2)

    week1csvfiles = dir(fullfile('./data/', "*" + fruit + "*W1.csv"))
    week2csvfiles = dir(fullfile('./data/', "*" + fruit + "*W2.csv"))

    for index = 1:length(week1csvfiles)
        basefile = week1csvfiles(index).name;
        folder = week1csvfiles(index).folder;
        fullfile = week1csvfiles(folder, basefile);

        rawdata = readfruitfile(fullfile);

    end

end

% cleandata = formatfruit(rawdata);
