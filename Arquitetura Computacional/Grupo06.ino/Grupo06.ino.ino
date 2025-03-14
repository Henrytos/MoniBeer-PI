const int PINO_SENSOR_TEMPERATURA = A4; // Indicar a porta analogica que será utilizada no sensor;
float temperaturaCelsius; // declaração da variavel que receberá a temperatura em celsius;

void setup(){ //Prepara a função de configuração de ambiente;
Serial.begin(9600); // inicia a porta serial ou seja, configa a quantidade de bits que vão transicionar pelo código
}

void loop(){ // Define o bloco de repetição do código;

int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA); // inicia a leitura dos dados do sensor de temperatura segundo o pin;
temperaturaCelsius = ((valorLeitura * 5.8 / 1023.0) / 0.01)- 10; //Converte o sistema de numeração desconhecido para celcius e 
//regula a temperatura com menos 10 ;
float TempMax = 22.00;
float TempMin = 18.00;
Serial.print("TemperaturaMinima:");
Serial.print(TempMin);
Serial.print(",");
Serial.print("Temperatura:");
Serial.print(temperaturaCelsius); // Printa a variavel no monitor serial; 
Serial.print(",");
Serial.print("TemperaturaMáxima:");
Serial.println(TempMax); 
 //Printa a string na mesma linha e ocupa toda linha;

delay(1000); //Adiciona 2 segundos de atraso;

}
