pkg load arduino

Vermelho = "d13";
Amarelo = "d12";
Verde = "d11";

while true
    id = tic;
    writeDigitalPin (arduino, Vermelho, 1);
    toc(id)


    id = tic;
    writeDigitalPin (arduino, Vermelho, 1);
    toc(id)

    id = tic;
    writeDigitalPin (arduino, Vermelho, 1);
    toc(id)

    id = tic;
    writeDigitalPin (arduino, Vermelho, 0);
    toc(id)


    id = tic;
    writeDigitalPin (arduino, Vermelho, 0);
    toc(id)

    id = tic;
    writeDigitalPin (arduino, Vermelho, 0);
    toc(id)
endwhile