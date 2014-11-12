%% Question 2 and 3
%% Code
function main = main()

  function result = search(tdm, query, tolerance)
		[row_n, col_n] = size(tdm);
		%%Cosine
		result_array = zeros(2,col_n);
		for n = 1:col_n
			numerator = dot(tdm(:,n), query);
			denominator = norm(tdm(:,n))*norm(query);
			vector_cos = numerator/denominator;
			if vector_cos < tolerance
				result_array(1,n) = vector_cos;
        result_array(2,n) = 0;
			else
				result_array(1,n) = vector_cos;
        result_array(2,n) = 1;
			end
		end

		result = result_array;
	end
	in_matrix = [1 0 0 1 0; 1 0 1 1 1; 1 0 0 1 0; 0 0 0 1 0; 0 1 0 1 1; 0 0 0 1 0];
	query1 = [1 0 1 0 0 0]';
	query2 = [1 0 0 0 0 0]';
	query3 = [0 0 1 0 1 0]';
	query4 = [0, .5, 0, 0, 1, 0]';
	tolerance = .5;

	"Row one = cos angles"
	"Row two = Accept or Reject"
	query1_result = search(in_matrix, query1, tolerance)
	query2_result = search(in_matrix, query2, tolerance)
	query3_result = search(in_matrix, query3, tolerance)
	query4_result = search(in_matrix, query4, tolerance)

end

%% Results
%% query1_result =
%% 
%%    0.81650   0.00000   0.00000   0.57735   0.00000 - Cos Angle
%%    1.00000   0.00000   0.00000   1.00000   0.00000 - 1 = Accept, 0 = Reject
%% 
%% query2_result =
%% 
%%    0.57735   0.00000   0.00000   0.40825   0.00000
%%    1.00000   0.00000   0.00000   0.00000   0.00000

Question 4:

%% a - What is the difference between pastry and bread?
%%	the important words here are difference, pastry, and bread - between is probably too general to give useful results,
%%	but I could be wrong. given the very small dictionary we have, the query could be represented as [0, 0, 1, 0, 1, 0]'
%%
%%
%%
%%	The useful results here will likely be the ones which have both pastry and bread in the title - trying it out with our script
%%	we find that the angle between the vectors when both pastry and bread is in the .70711. This makes me think .7 would be a reasonable
%%	threshold
%%
%%	query3_result =
%%
%%  0.40825   0.70711   0.00000   0.57735   0.50000
%%   0.00000   1.00000   0.00000   1.00000   0.00000
%%
%% b - Show me all recipes for pastry.
%%	here it seems that all results for pastry would be relevent, with titles also containing recip(i,es) being given a higher preference
%%	when the search results are returned. the "all" modifeir is interesting, and if I were writing an actual search engine using a synonym weighting
%%	scheme seems like it would be a reasonable approach so all and quantity might be loosly related. A query might be [0, .5, 0, 0, 1, 0]
%%
%% query4_result =
%%
%%  0.25820   0.89443   0.44721   0.54772   0.94868
%%   0.00000   1.00000   0.00000   1.00000   1.00000
%%
%%	The threshold for all documents showing recipes might be .5 - this seems to return the most relevent information. 

%% All in all, the more picky I could afford to be the better. this is where googles 30 billion documents are a huge advantage;
%% You can afford to be really picky about your threshold. 