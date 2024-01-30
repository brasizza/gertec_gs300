# gertec GS300
<h1> Package para trabalhar com os componentes da gertec <strong>SOMENTE em ANDROID! </strong></h1>


# Iniciando
**Por mais que o código esteja em inglês, o readme e o CHANGELOG estarão em português para facilitar o entendimento**

Este package tem como finalidade ajudar os desenvolvedores que precisam utilizar algum componente da elgin/bematech, pois eles são bem chatos de configurar e acaba as vezes sendo bem frustrante!


 ## Package foi testado em:
```bash
Gertec GS300 
```

<p align="left">
  <img src="https://github.com/brasizza/gertec_gs300/blob/master/images/gs300.png?raw=true"  
  title="GS300" width="200">
</p>



### Portanto se você quiser ajudar a homologar mais aparelhos me contate para que possamos agilizar esse processo   
## O que o package faz até o momento

# IMPRESSORA
- [ x ] Escreve uma linha ou um texto estilizado (tipos de estilo no final do readme) -  **printText**
- [ x ] Avança x linhas à sua escolha - **wrap**
- [ x ] Faz o corte de papel - **cutPaper**
- [ x ] Imprime códigos de barras de todos os estilos e modelos (tipos de modelos no final do readme) - **printBarCode**
- [ x ] Imprime qrcodes com todos os tipos de correções e tamanhos - **printQrcode**
- [ x ] Envia comando escpos diretamente para impressora, caso você já tenha um script de escpos é só utilizar este comando (Necessário ativar o bluetooth - porém o package faz isso automaticamente)
- [ x ] Desenha uma linha com o caractere customizável para separar áreas de impressão  - **line**
- [ x ] Imprime uma imagem tanto vinda da web quanto de algum asset (ver exemplo) - **printImage**
- [ x ] Pega e status da impressora (tipos disponíveis no final do readme)




**Tela com as funcionalidades de exemplo**

<p align="left">
  <img src="https://github.com/brasizza/gertec_gs300/blob/master/images/gs300_tela.png?raw=true"  
  title="GS300" width="400">
</p>


## Comandos básicos para conexão ##

```dart
    final _gertecPrinterPlugin = GertecGs300();
    await _gertecPrinterPlugin.printText('HELLO PRINTER');
    await _gertecPrinterPlugin.wrapLine(2);
    await _gertecPrinterPlugin.cutPaper();
    
   
```
## Listagem de configurações disponíveis


<details>
<summary>Erros que são capturados pelo  <strong>printerState()</strong></summary>


```dart
///Where in the barcode the text will be show
enum PrinterState {
  PRINTER_STATE_NORMAL(1),
  PRINTER_STATE_UNKNOWN(3),
  PRINTER_STATE_NOPAPER(4),

  const PrinterState(this.value);
  final int value;
}

```
</details>



<details>
<summary><strong>Tipos de código de barras</strong></summary>

```dart
enum BarCodeType {
  BARCODE_TYPE_UPCA(0),
  BARCODE_TYPE_UPCE(1),
  BARCODE_TYPE_JAN13(2),
  BARCODE_TYPE_JAN8(3),
  BARCODE_TYPE_CODE39(4),
  BARCODE_TYPE_ITF(5),
  BARCODE_TYPE_CODEBAR(6),
  BARCODE_TYPE_CODE93(7),
  BARCODE_TYPE_CODE128(8);

  const BarCodeType(this.value);
  final int value;
}
```

</details>



<details>
<summary><strong>Tipos de alinhamentos</strong></summary>

```dart
enum PrintAlign {
  LEFT(0),
  CENTER(1),
  RIGHT(2);

  final int value;
  const PrintAlign(this.value);
}
```
</details>





<details>
<summary><strong>Tamanho de fontes disponíveis (podendo colocar qualquer valor customizado também)</strong></summary>

```dart
enum FontSize {
  SMALL(16),
  NORMAL(20),
  LARGE(30),
  XLARGE(40);

  final int value;
  const FontSize(this.value);
}
```
</details>






<br>
<hr>
Esse package te ajudou? quer mais coisas nele ou outros devices elgin? Me ajude a manter o projeto ativo e implementar novos equipamentos (que provavelmente terei que adquirir)

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate?business=5BMWJ9CYNVDAE&no_recurring=0&currency_code=BRL)
