function [] = sendMessageToArd(handles,arduino)

arr = '!0000000';
if handles.servo1_disp.Value == 1
    arr(2) = '1';
else
    arr(2) = '0';
end

if handles.servo2_disp.Value == 1
    arr(3) = '1';
else
    arr(3) = '0';
end

if handles.servo3_disp.Value == 1
    arr(4) = '1';
else
    arr(4) = '0';
end

if handles.servo4_disp.Value == 1
    arr(5) = '1';
else
    arr(5) = '0';
end

if handles.eeg_sig.Value == 1 %daca este selectat modul automat care are tag-ul "eeg_sig"
    arr(6) = '0'; % daca este selectat, caracterul de pe pozitia 6 este "0"
else
    arr(6) = '1'; % daca nu este selectat, inseamna ca dorim modul manual, deci caracterul
                    %de pe poz 6 este "1!
end

if handles.servo1_sel.Value == 1
    arr(7) = '1';
end

if handles.servo2_sel.Value == 1
    arr(7) = '2';
end

if handles.servo3_sel.Value == 1
    arr(7) = '3';
end

if handles.servo4_sel.Value == 1
    arr(7) = '4';
end

if handles.porneste.Value == 1
    arr(8) = '1';
else
    arr(8) = '0';
end

disp('Mesaj catre Arduino:');
arr(length(arr)+1)=sprintf('\r');
disp(arr);

fprintf(arduino,'%s',arr);

