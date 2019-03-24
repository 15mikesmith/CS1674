%	Basic matlab tutorial for Cs students
%	
%


%*********************************************************
% 1. Basic language constructs
%*********************************************************

%
%%%%%%%%%%%  assignment of a value to a variable

a=10        % assignment of a value (with printing)

a=5;        % assignment of a value (w/o printing it)

'Print a character string' %% prints a string

%%%%%%%%%%%  if 

if a==4     % equality condition
   b=a^2;   % a squared
else 
   if a~=10 % not equal
      b=a;
   else
      b=-a;
   end
end


%%%%%%%%%% loops 
% for loop

for i=1:5
	i   
end

j=4

pause  %Pause means program sleeps until we press any key

%
% while loop
while j>0
   j=j-1
end

pause

%
%
%%%%%%%%%%%% case structure
%

 x=input('Value of x') % asks for the input
  switch x
          case {2,4}
          'X is even' %%% prints the string
          case {1,3} %  Braces!!!
          'X is odd'
          case 0
          'X is zero'
          otherwise
          'Out of range' 
        end
%
%%%%%%%%%%  Scripts, subroutines and functions
%
%  Script is any syntactically correct sequence of
%  matlab commands.
%  Script can be executed by specifying the name of the script (files of type xxx.m)

'Available variables in main program listed by whos'
whos
pause
tutorial_script  %% runs a script in file tutorial_script.m

%
% Function has a specific syntax and should be called.
% It can have more than one input and output arguments.
% Normally, arguments are transfered by value. It is possible to submit arguments by
% reference (as common attributes for caller and the function), but you'll never need this...

[x_sq,x_cube]=tutorial_function(x);  %% calls a function tutorial_function
x_sq
x_cube

%
%  Help system
%

help str2num %help function_name gives help for any function (including functions that we define)
pause
help tutorial_function
pause

'Functions to find a specified function'
help lookfor %as we readm lookfor find all files that have a specified string in its first (commented) line
'BE patient...'
lookfor str2num

which str2num % Finds a place where a specified function is defined


%*********************************************************
% 2. Input/output
%*********************************************************
%
%
% input/output

%
% input
%

x=input('Input for computation');
y=x^2; %This will not be printed
z=x^3  %this WILL be printed

pause

new_string=input('Input a string','s');
latest_string=['You entered ', new_string]


pause

%
% How to save results
%
%

W=[1 2 3
   4 5 6
   7 8 9
  10 11 12]

%'To save specified variables into specified file in ascii form'
save ascii_file_name W -ascii 

%'To save specified variables into specified file in binary (matlab-specific) form'
save binary_file_name W  

% To save ALL variables, write only a file name. All variables in scope will be saved
% (of course, we can save in subroutines too)

save binary_file_name1

%
% How to delete one or all variables in the working memory
%
%
%
whos W
pause
clear W
whos 
'there is no "W" anymore'
pause
clear all  %delete all variables in scope
whos
'everything is deleted'
pause
%
% How to load results
%
%

%
% From a binary file
%

load  binary_file_name1
whos
'we retrieved everything :)'
pause

clear W
whos W
%%% loads a specific variable from a binary file
load binary_file_name W
whos W

%
% load from an ASCII file ( !!! used frequently to read the data in Matlab !!!)
%% if the data are in the matrix form the read is easy 
clear W
whos W
load ascii_file_name
W=ascii_file_name

%% if the data are not in the matrix form 
%% we must write our own program using scanf functions


%*********************************************************
% 3. Operations
%*********************************************************

%
% 3.1 Scalar operations
%

'all operations defined'
x=13
y=7
x-y
x+y
x*y
x/y
pause
'Some exotic also'
mod(x,y) %modulus
x=12.5
ceil(x)
floor(x)
round(x)
pause
'Numerous functions'
sin(x)
cos(y)
tan(pi*x) %if not overloaded, pi=3.14159265354...
exp(x+i*y) %if not overloaded, i is imaginary unit
pause
x/0 %result is infinity
0/0 %result is not a number
pause
%
% 3.2 Vector operations
%

row_vector=[1 2 3 4]
column_vector=[4 5 6 7]' %' is the transposition

pause

%
%
% length gives the number of elements in vector
length(row_vector)
length(column_vector)

size(row_vector)
size(column_vector)

%%% inner product
scalar_multiplication=row_vector*column_vector % !!! vectors must have the same length
scalar_multiplication
                                               
pause

%
% this is equal to:
%

ugly_slow_scalar_multiplication=0 

for i=1:length(column_vector)
   ugly_slow_scalar_multiplication=ugly_slow_scalar_multiplication+   row_vector(i)*column_vector(i);
end
ugly_slow_scalar_multiplication

'Do not use for loop whenever you can use vectors/matrices!!!'


%
% 3.3 Matrix operation
%

pause

%%%% outer product (result of the multiplication of two vectors)!
matrix_multiplication=column_vector*row_vector; 
matrix_multiplication

%
% More about matrix multiplication
%

A=[1 2 3
   4 5 6
   7  8 9]

B=[1 2
   -1 -2
    2  3]
 
 
size(A,1)
size(A,2)
size(B,1)
size(B,2)

'Matrix multiplication is possible only when size(A,2)=size(B,1)'
'Result is a matrix size(A,1) x size(B,2)'

C=A*B

pause

%%% ugly way to do matrix multiplication - Have you ever had to write such a code?
ugly_matrix=zeros(size(A,1),size(B,2)) %initialization! fills matrix with zeros
for i=1:size(A,1)
   for j=1:size(B,2)
      for k=1:size(A,2)
         ugly_matrix(i,j)=ugly_matrix(i,j)+A(i,k)*B(k,j);         
      end
   end
end

ugly_matrix

pause

%
% Other interesting matrix operations
%
%

%  Select 3.rd column of matrix
%
%

A3=A(:,3);

% Select first row
%
%

A1=A(1,:);

% Select submatrix
%
%

AAAA=A(1:2,1:2)

'Element-wise multiplication'

D=[1 2 3; 4 5 6] % another way to represent matrix, use ; to separate rows
E=[1 2 3
   4 5 6]


F=D.*E    


'Another (ugly) way to accomplish this'

F_ugly=zeros(size(D,1),size(D,2));
for i=1:size(D,1)
   for j=1:size(D,2)
      F_ugly(i,j)=D(i,j)*E(i,j);
   end
end
F_ugly

pause

'Element-wise division of vectors'

a=[1 2 3 4]
b=[1 3 5 9]

   c=a./b


pause

'D.^2 is defined, but D^2 is not!'

D_elementwise_squared=D.^2


%
% 3.4 Vector and constant
%
%

'v is vector, c is scalar'

v=[1 2 3 4]
c=2

'When constant is added/substracted to the vector, it is added/substracted from EACH element'
v-c
v+c
pause
'Constant can simply multiply or divide a vector'
v/c
v*c
pause

'However only c./v is defined and gives [c/v(1)...c/v(length(v))'
c./v

%
% 3.5 Matrix and vector
%

'For all purposes, vector is 2D matrix with one dimension equal to 1.'
x=[1 2 3]'   %% remember ' means transpose
A=[1 -2 3
   0  1  2
   0  0  1]
b=A*x


 pause
 
 %
 % Matrix inversion or how to solve linear system
 %
 
 x_solved=inv(A)*b    %%% equation Ax'=b   solved x = inv(A)b
 x_solved_another_way=A\b  %%% backslash
 
 
 pause
 
 %
 % The application of matrix computation for linear regression
 % 
 
 x=rand(1,100) % random values
 xDumb=[ones(1,100); x]
 A =[1     2] % bias and slope parameters of a linear model
 y=A*xDumb+randn(1,100)*0.1; %y=1+2x+random_noise
 A_solved=y/xDumb  % performs linear regression, least squares solution of overdetermined system!
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 4. Matrix functions
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
'So, what about matrix functions and operations'
'Recall thatF='
 F
 'sqrt(F)=D!'
sqrt(F)  % Squareroots of each element


%
%  4.1 Basic aggregate functions
%    
%  

A=[1 2 3 4
   5 6 7 8
   9 10 11 12]

sum(A)  % sumation performed by first index (sums of columns!)
sum(A,2) % sumation performed by the second index (sum of rows)
sum(sum(A)) %sum of the whole matrix

pause
'Products are also defined'
prod(A) 
prod(A,2) 

'Do not use this!!!'
ugly_product=ones(1,size(A,2)) %all elements are 1
for i=1:size(A,1)
   for j=1:size(A,2)
      ugly_product(j)=ugly_product(j)*A(i,j);
   end
end

'As we can see:ugly_product-prod(A)=0. The following will have a (logical) value 1'

(ugly_product-prod(A))==0
pause

%means and standard deviations
mean_A_column=mean(A)    %columns
mean_A_row=mean(A,2)  %rows
std_A_column=std(A)     %rows
std_A_row=std(A,[],2) %columns ([] MUST be here)

%
% 4.2 Special matrices
%


diagonal_matrix=diag([1 2 3 4])
all_zeros=zeros(3,4)
all_ones=ones(4,2)
unit_matrix=eye(4)
pause

%
% 4.3 Transformation of matrices
%


%
% Matrix repetition
%

v=[1 2 3];
V1=repmat(v,3,1)
V2=repmat(v,1,3)
VV=repmat(v,2,2)
v_tran=v';
vv_tran=repmat(v_tran,3,1)


pause

%
% Matrix transformation
%

A=[1 2 3 4 5 6 7 8 9 10 11 12]
A_matrix=reshape(A,3,4); %Of course, 3*4=length(A), i.e. total number of elements must not change
A_matrix
pause


%%%% Multidimensional arrays %%%%

MX=zeros(3,3,3);
MX
A
MX=reshape(A,2,3,2);
MX

%%% Structures %%%
%% accessed with attributes %%% 
a=struct('temp',72,'rainfall',0.0);
a
a.temp

weather(3) = struct('temp',72,'rainfall',0.0); %% initialize 3rd element of weather array
  
weather =   repmat(struct('temp',72,'rainfall',0.0),1,3); %% creates weather matrix with the same initial values

%%% cell structures
%%% creates a cell array 
A = {[1 4 3; 0 5 8; 7 2 9], 'Anne Smith'; 3+7i, -pi:pi/4:pi};
A(1)
A{1}
A{1}(1,1)
A(1,1,2)
[a b c d]=deal(A{:});
a
b
c
d


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 5. Special topics
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% 5.1	How to plot results
%
%

A=[1 2 3 4 5 7 9];
B=[12 13 14 14 11 10 8];

plot(A,B); %both arguments are vectors of the same length
pause
C=B-4;
hold on; %retained old graph, new graph is added
plot(A,C,'*-r'); %this line is read and has stars and lines
pause
xlabel('Month')
ylabel('Power consumption')
title('This is demo graph') %title
legend('New York','Pittsburgh') %label of the graph
pause
hold off %next graph will cover this graph
plot(A,C./B);
title('Consumption ratio')
pause
figure; %opens new plot
C=eye(10,10);
imagesc(C);
title('The way to plot matrices')
C
pause
close all %close all images
[X Y]=meshgrid(-pi:pi/10:pi,-pi:pi/10:pi); %grid to compute function in even intervals
Z=sin(2*X).*cos(3*Y);
surf(X,Y,Z); %Plots 3D function
pause
imagesc(Z);colorbar %this is 2D plot of the function
pause
% We can easily plot 3D trajectory...
%
%
t=0:0.1:5;
x=sin(pi*t)+0.1*t;
y=cos(pi*t)-0.2*t;
z=2*t;
plot3(x,y,z,'d:m'); %shows magenta diamonds in addition to dotted line
grid on %to show grid, of course, grid off turns grid off
xlabel('x')
ylabel('y')
zlabel('z')
pause
%
%
% 5.2 Very powerful find functions
%
% picks components satisfying a condition
a=[ 1 2 3 4 5]
find(a>2)


'Outputs are indices that correspond to values of vector that satisfy the predicate (a>2)'

pause

some_probability_vector=[0.2 0.7 0.4 0.6 0.12 0.44 0.72]
'Replaces all values larger than 0.6 with 1'
some_probability_vector(find(some_probability_vector>0.6))=1

pause
%
% 5.3 Sort function
%

A=[94 55 23 12 10] % Say, points from the test
B=[10223 234324 234345 1223 232] % say students ID numbers
pause
[A,index]=sort(A);  %student points sorted according to the results on test
A
B=B(index) %student IDs sorted according to students' results on the test
pause

%
% Sort can be applied on matrices to. Sorting can be done by rows or by columns...
'Some simple matrix'
A=[ 1 2 3;10 9 8;5 6 7]
pause
'Each column is independently sorted'
sort(A,1)

pause
'Each row is independently sorted'

sort(A,2)

%
%
% 5.4 Random number generators and histograms
%

% Random vectors

normal_vector=randn(1000,1);
hist(normal_vector,20) %its histogram with 20 bins 
title('Normal distribution')
pause

figure
uniform_vector=rand(1000,1);
hist(uniform_vector,20) %its histogram with 20 bins 
title('Uniform distribution')
pause

figure

chi_square_vector_df3= chi2rnd(3,1000,1)
hist(chi_square_vector_df3,20) %its histogram with 20 bins 
title('\chi^{2} distribution')
pause
%This and other more involved distributions (such as beta,F,t...) 
%are from statistical toolbox

close all

'Generate random permutation' %shuffling playing cards...


for i=1:3
A=randperm(10)
pause(2)
end

%
% Random matrices
%

A=randn(128,64);

subplot(1,2,1),imagesc(A),title('Original image')
B=[1 1 1;1 1 1;1 1 1]/9;
A=filter2(B,A); %function for 2-dimensional filtering (just for illustration, here smooths the image)
subplot(1,2,2),imagesc(A),title('Smoothed random image') 


