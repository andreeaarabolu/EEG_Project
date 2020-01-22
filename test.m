arduino=serial('COM5','BaudRate',9600);
fopen(arduino);

arr = '0000000'
fprintf(arduino,arr)
arr = '0011111'
fprintf(arduino,arr)

fclose(arduino);