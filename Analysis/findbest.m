function [bestindex1, bestindex2] = findbest(s1, s2)
    bestindex1 = 0;
    bestindex2 = 0;

    bestvalue = 1/0;

    for index1 = 1:size(s1, 2)

        for index2 = 1:size(s2, 2)
            [h, p, ci] = ttestfruit(s1(:,index1), s2(:,index2));

            if p < bestvalue
                bestindex1 = index1;
                bestindex2 = index2;
                bestvalue = p;
            end

        end

    end

end
