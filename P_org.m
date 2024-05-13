function [P,O] = P_org(A,p0)
%% position
    p_extended  = [p0;1];
    P_temp =  A*p_extended;
    P = P_temp(1:3);
%% Orientation
    O(2)  = atan2(-A(3,1),sqrt((A(3,2)^2)+(A(3,3)^2))); %pitch
    O(1)  = atan2(A(3,2)/cos(O(2)),A(3,3)/cos(O(2)));  %roll
    O(3)  = atan2(A(2,1)/cos(O(2)),A(1,1)/cos(O(2)));  %yaw
     %O(1)  = atan2(A(2,3),A(3,3));  %roll
    %O(2)  = asin(-A(3,1)); %pitch
    %O(3)  = atan2(A(2,1),A(1,1));  %yaw
end