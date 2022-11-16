function data = readfruitfile(filename)
	rawdata = csvread(filename, 1);

	[t, n] = size(rawdata)

	data = []

	for trial = 1:(n/2)
		col = trial * 2;
		peak = max(rawdata(:, col));
		data = [data ; peak];
	end
end