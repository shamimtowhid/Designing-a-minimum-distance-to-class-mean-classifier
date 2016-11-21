% Given sets
%class1 = [2 2; 3 1; 3 3; -1 -3; 4 2; -2 -2];
%class2 = [0 0; -2 2; -1 -1; -4 2; -4 3; 2 6];

class1 = [2 -1;3 0;3 2;-1 -3;4 1;-2 -4;0 -1;-2 2;-1 -4;-4 1];
class2 = [0 0;-2 1;-1 -1;-4 4;-4 1;2 6;2 2;3 1;3 -1;-1 -3];

% Plotting all samples in a graph 
plot(class1(:,1),class1(:,2),'s','MarkerFaceColor','g');
hold on;

plot(class2(:,1),class2(:,2),'d','MarkerFaceColor','r');


% Calculating means of class 1 and 2

mean1 = [ mean(class1(:,1)) mean(class1(:,2))];

plot(mean1(1),mean1(2),'*','MarkerFaceColor','g');
mean2 = [ mean(class2(:,1)) mean(class2(:,2))];
plot(mean2(1),mean2(2),'*','MarkerFaceColor','r');
% Sample points
x = [-1 -1; 3 2; -2 1; 8 2];
% Plotting the sample points

for n = 1:4   
 %dist1=sqrt( ( mean1(1)-x(n) )^2 + ( mean1(2)-x(n+4) )^2 );
 %dist2=sqrt( ( mean2(1)-x(n) )^2 + ( mean2(2)-x(n+4) )^2 ); 
 
 %if dist1 < dist2
  %  plot(x(n,1),x(n,2),'v','MarkerFaceColor','g');
 %else
  %  plot(x(n,1),x(n,2),'v','MarkerFaceColor','r');
 %end
 
 val1 = x(n,:) * mean1'  - .5 * (mean1 * mean1');
 val2 = x(n,:) * mean2'  - .5 * (mean2 * mean2');
 
 if val1 > val2
    plot(x(n,1),x(n,2),'v','MarkerFaceColor','g');
 else
    plot(x(n,1),x(n,2),'v','MarkerFaceColor','r');
 end
 
end

% Calculating decision boundary between two classes

coeff=mean1-mean2;
const= -0.5*det((mean1' * mean1)- (mean2' * mean2));
xvalue = -4:0.1:8;
for i=1:length(xvalue)
    yvalue(:,i) = -((coeff(1,1)* xvalue(:,i)+const)/coeff(1,2));
end
final_xy_matrix=[xvalue',yvalue'];
plot(final_xy_matrix(:,1),final_xy_matrix(:,2),'--','MarkerFaceColor','y');


legend('Class 1','Class 2','Class 1 mean','Class 2 mean');

title('Designing a minimum distance to class mean classifier');
grid;
ylabel('The y axis');
xlabel('The x axis');
hold off;
