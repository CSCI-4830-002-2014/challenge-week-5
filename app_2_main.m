function x = search(tdm, query, tolerance)
  [row_n, col_n] = size(in_matrix)
	%%Cosine
	cos_array = zeros(col_n)
	for n = 1:col_n
		numerator = dot(in_matrix(:,n), query)
		denominator = norm(in_matrix(:,n))*norm(query)
		cos_array = numerator/denominator
  end
  x = cos_array
end

in_matrix = [1 0 0 1 0; 1 0 1 1 1; 1 0 0 1 0; 0 0 0 1 0; 0 1 0 1 1; 0 0 0 1 0];
query1 = [1 0 1 0 0 0]';
query2 = [1 0 0 0 0 0]';
tolerance = .5;

search(in_matrix, query1, tolerance)