function [pyramid, level_0, level_1, level_2] = test(im, sift, means)

descriptors = sift.d;
frames = sift.f;
%size(descriptors)
m = means;
%size(m)

[height, width] = size(im);


level_0 = computeBOWRepr(double(descriptors'),m');


    q1_descriptors = [];
    q2_descriptors = [];
    q3_descriptors = [];
    q4_descriptors = [];
    
    for i = (1 : length(frames))
        x = (frames(1, i)/width) * 100.00;
        y = (frames(2, i)/height) * 100.00;
        
        if x <= 50 && y <= 50
            q1_descriptors = [q1_descriptors descriptors(:, i)];
        elseif x > 50 && y <= 50
            q2_descriptors = [q2_descriptors descriptors(:, i)];
        elseif x <= 50 && y > 50
            q3_descriptors = [q3_descriptors descriptors(:, i)];
        elseif x > 50 && y > 50
            q4_descriptors = [q4_descriptors descriptors(:, i)];
        end
    end
        
    level_1 = [computeBOWRepr(q1_descriptors', means') computeBOWRepr(q2_descriptors', means') computeBOWRepr(q3_descriptors', means') computeBOWRepr(q4_descriptors', means')];

    
    
    q1_descriptors =  [];
    q2_descriptors =  [];
    q3_descriptors =  [];
    q4_descriptors =  [];
    q5_descriptors =  [];
    q6_descriptors =  [];
    q7_descriptors =  [];
    q8_descriptors =  [];
    q9_descriptors =  [];
    q10_descriptors = [];
    q11_descriptors = [];
    q12_descriptors = [];
    q13_descriptors = [];
    q14_descriptors = [];
    q15_descriptors = [];
    q16_descriptors = [];
    
    for i = (1 : length(frames))
        x = (frames(1, i)/width) * 100.00;
        y = (frames(2, i)/height) * 100.00;
        
        if     x <= 25  && y <= 25
            q1_descriptors = [q1_descriptors descriptors(:, i)];
        elseif x <= 50  && y <= 25
            q2_descriptors = [q2_descriptors descriptors(:, i)];
        elseif x <= 75  && y <= 25
            q3_descriptors = [q3_descriptors descriptors(:, i)];
        elseif x <= 100 && y <= 25
            q4_descriptors = [q4_descriptors descriptors(:, i)];
        elseif x <= 25  && y <= 50
            q5_descriptors = [q5_descriptors descriptors(:, i)];
        elseif x <= 50  && y <= 50
            q6_descriptors = [q6_descriptors descriptors(:, i)];
        elseif x <= 75  && y <= 50
            q7_descriptors = [q7_descriptors descriptors(:, i)];
        elseif x <= 100 && y <= 50
            q8_descriptors = [q8_descriptors descriptors(:, i)];
        elseif x <= 25  && y <= 75
            q9_descriptors = [q9_descriptors descriptors(:, i)];
        elseif x <= 50  && y <= 75
            q10_descriptors = [q10_descriptors descriptors(:, i)];
        elseif x <= 75  && y <= 75
            q11_descriptors = [q11_descriptors descriptors(:, i)];
        elseif x <= 100 && y <= 75
            q12_descriptors = [q12_descriptors descriptors(:, i)];
        elseif x <= 25  && y <= 100
            q13_descriptors = [q13_descriptors descriptors(:, i)];
        elseif x <= 50  && y <= 100
            q14_descriptors = [q14_descriptors descriptors(:, i)];    
        elseif x <= 75  && y <= 100
            q15_descriptors = [q15_descriptors descriptors(:, i)];        
        elseif x <= 100 && y <= 100
            q16_descriptors = [q16_descriptors descriptors(:, i)];
        end
        
    end
    
    level_2 = [computeBOWRepr(q1_descriptors', means') computeBOWRepr(q2_descriptors', means') computeBOWRepr(q3_descriptors', means') computeBOWRepr(q4_descriptors', means') computeBOWRepr(q5_descriptors', means') computeBOWRepr(q6_descriptors', means') computeBOWRepr(q7_descriptors', means') computeBOWRepr(q8_descriptors', means') computeBOWRepr(q9_descriptors', means') computeBOWRepr(q10_descriptors', means') computeBOWRepr(q11_descriptors', means') computeBOWRepr(q12_descriptors', means') computeBOWRepr(q13_descriptors', means') computeBOWRepr(q14_descriptors', means') computeBOWRepr(q15_descriptors', means') computeBOWRepr(q16_descriptors', means')];

    
        
    pyramid = horzcat(level_0, level_1, level_2);
    
end

