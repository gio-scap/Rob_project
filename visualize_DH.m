function visualize_DH(robot,q)
%% function to display the frames assigned with the DH convention
% robot = serialink object rapresenting the robot
% q = vector of configuration if not guven as inout q = 0 vector

n = length(robot.links);
if nargin==1
    q = zeros(1,n);
end

robot.plot(q), set(gcf,'Visible','on');
hold on
[~,A] = robot.fkine(q);
for i=0:n
    if i==0
        trplot(SE3([0 0 0]),'frame', num2str(i),'arrow','length',0.5,'color','k')
    else
        trplot(A(i), 'frame', num2str(i),'arrow','length',0.5,'color','k')
    end
end

