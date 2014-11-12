function main = main()
function x = search(tdm, query, tolerance)
  [row_n, col_n] = size(tdm)
	%%Cosine
	cos_array = zeros(1,col_n)
	for n = 1:col_n
		numerator = dot(tdm(:,n), query)
		denominator = norm(tdm(:,n))*norm(query)
		cos_array[1,n] = numerator/denominator
end
  x = cos_array
end
	in_matrix = [1 0 0 1 0; 1 0 1 1 1; 1 0 0 1 0; 0 0 0 1 0; 0 1 0 1 1; 0 0 0 1 0];
	query1 = [1 0 1 0 0 0]';
	query2 = [1 0 0 0 0 0]';
	tolerance = .5;

	result = search(in_matrix, query1, tolerance)
end
