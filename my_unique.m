function [N] = my_unique(M)

% A = randi( 3, 10, 2 ) ;

 nRows = size(M, 1) ;
 keep  = true(nRows, 1) ;
 for rowId = 2 : nRows
    if any(all(repelem(M(rowId,:),rowId-1, 1) == M(1:rowId-1,:), 2));
        keep(rowId) = false ;
    end
 end
 N = M(keep,:) ;



end

