function data = readfruitfile(filename)

	filepath = split(filename, "/");
	fileroot = filepath(1:end-1);

    filedata = split(string(filepath(end)), "_");
    filedata(3) = "02";

    filename2 = strjoin([fileroot ; strjoin(filedata, "_")], "/");

    % disp("Reading " + filename + " and " + filename2)

    rawdata = csvread(filename, 1);
    rawdata2 = csvread(filename2, 1);

    [t, n] = size(rawdata);

    data = [];

    for trial = 1:(n / 2)
        col = trial * 2;
        peak = max(rawdata(:, col));
        data = [data; peak];
    end

    [t, n] = size(rawdata2);

    for trial = 1:(n / 2)
        col = trial * 2;
        peak = max(rawdata2(:, col));
        data = [data; peak];
    end

end
