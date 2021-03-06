type = 'cstpagndeqhrkmilvfyw';
Matrix = blosum(62,'Order', type);
gap = -8;
% seq1 = 'rkvagmakpnm';
% seq2 = 'rkiavaaaskpav';
seq2 = 'vdscy';
seq1 = 'veslcy';
result = zeros(length(seq1)+1,length(seq2)+1);
result(:,1) = 0:gap:gap*(length(seq1));
result(1,:) = 0:gap:gap*(length(seq2));
[m,n] = size(result);
for i = 2:m
    for j = 2:n
        num = max([result(i-1,j)+gap, result(i,j-1)+gap, result(i-1,j-1) + Matrix(type == seq1(i-1),type == seq2(j-1))]);
        result(i,j) = num;
    end
end