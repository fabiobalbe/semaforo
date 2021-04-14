clc
clear()

pkg load arduino

status = -1;
espera_passagem = 5;
espera_atencao = 1;

writeDigitalPin (arduino, "d13", 0);
writeDigitalPin (arduino, "d12", 0);
writeDigitalPin (arduino, "d11", 0);
writeDigitalPin (arduino, "d3", 0);
writeDigitalPin (arduino, "d2", 0);

function pedestre (status)
    if (status == 1)
        printf("SINAL FECHADO\n\n")

        d = tic;
        writeDigitalPin (arduino, "d3", 0);
        writeDigitalPin (arduino, "d2", 1);
        toc(d)

    elseif (status == 0)
        printf("ATENCAO\n\n")
    else
        printf("\aSINAL ABERTO\n\n")

        d = tic;
        writeDigitalPin (arduino, "d3", 1);
        writeDigitalPin (arduino, "d2", 0);
        toc(d)
        
    endif
endfunction

function luz (status)
    if (status == 1)
        printf("VERDE\n")

        id = tic;
        writeDigitalPin (arduino, "d13", 0);
        writeDigitalPin (arduino, "d12", 0);
        writeDigitalPin (arduino, "d11", 1);
        toc(id)

    elseif (status == 0)
        printf("AMARELO\n")

        id = tic;
        writeDigitalPin (arduino, "d13", 0);
        writeDigitalPin (arduino, "d12", 1);
        writeDigitalPin (arduino, "d11", 0);
        toc(id)

    elseif (status == -1)
        printf("VERMELHO\n")

        id = tic;
        writeDigitalPin (arduino, "d13", 1);
        writeDigitalPin (arduino, "d12", 0);
        writeDigitalPin (arduino, "d11", 0);
        toc(id)

    endif
endfunction

while true
    
    luz(status)
    pedestre(status)
    status++;
    pause(espera_passagem)

    luz(status)
    pedestre(status)
    status++;
    pause(espera_atencao)

    luz(status)
    pedestre(status)
    status--;
    pause(espera_passagem)
    
    luz(status)
    pedestre(status)
    status--;
    pause(espera_atencao)
endwhile