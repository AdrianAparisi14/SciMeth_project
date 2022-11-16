function cleandata = formatfruit(csvfiles);
    cleandata = [];
    for index = 1:length(csvfiles)
        filedata = split(csvfiles(index).name, "_");
        filenum = str2num(string(filedata(3)));

        if filenum == 1
            basefile = csvfiles(index).name;
            folder = csvfiles(index).folder;
            filepath = fullfile(folder, basefile);

            rawdata = readfruitfile(filepath);
            cleandata = [cleandata rawdata];
        end

    end
end
