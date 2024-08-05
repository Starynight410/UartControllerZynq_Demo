#include "mainwindow.h"
#include "ui_mainwindow.h"


#define START           "AT+START\n"
#define LED_ON          "$ w 1 1 a      "
#define LED_OFF         "$ w 1 0 a      "
#define SPI_SEND        "$ s 1 0 a      "
#define SPI_SEND_HEAD   "$ s 1 "

uint8_t Message = 0;
uint8_t StartSample = 0;
uint32_t param1, param2, param3 = 0;

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // Adding title for widget
    QWidget::setWindowTitle("SingleSerial");

    //Read BaudRate supported by Pc and attach to BaudRateBox
    QList<qint32> baudRates = info.standardBaudRates(); // What baudrates does my computer support ?
    QList<QString> stringBaudRates;
    for(int i = 0 ; i < baudRates.size() ; i++){
        stringBaudRates.append(QString::number(baudRates.at(i)));
    }
    ui->BaudRate->addItem("19200");
    ui->BaudRate->addItems(stringBaudRates);
    ui->lineEdit->setText("!@# 9 123456789");
    ui->lb_param1->setText("1");
    ui->lb_param2->setText("2");
    ui->lb_param3->setText("3");
    param1 = ui->lb_param1->text().toLong();
    param2 = ui->lb_param2->text().toLong();
    param3 = ui->lb_param3->text().toLong();

    //Read Current Ports
    QList<QSerialPortInfo> ports = info.availablePorts();
    QList<QString> stringPorts;
    for(int i = 0 ; i < ports.size() ; i++){
        stringPorts.append(ports.at(i).portName() + " " + ports.at(i).description());
//        stringPorts.append(ports.at(i).portName());
    }
    ui->Ports->addItems(stringPorts);

}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_Connect_clicked()
{
    QString PortsName = ui->Ports->currentText();
    PortsName = PortsName.mid(0,PortsName.indexOf(" "));

    ui->textBrowser->setTextColor(Qt::black);
    Ports.close();
    Ports.setPortName(PortsName);

    if(  !Ports.open(QIODevice::ReadWrite) ){
        if(!Ports.isOpen())
        {
            ui->textBrowser->append("Ports Not Open");
            ui->textBrowser->append(Ports.errorString());
        }
    }
    else
    {
        ui->textBrowser->setTextColor(Qt::black);
        ui->textBrowser->append("Port Connected");

        //Set BaudRate
        QString stringbaudRate = ui->BaudRate->currentText();
        int intbaudRate = stringbaudRate.toInt();
        Ports.setBaudRate(intbaudRate);
        QString BaudStr = "BaudRate = ";
        BaudStr += QString:: number(intbaudRate);
        ui->textBrowser->append(BaudStr);

        //Set DataBits
        Ports.setDataBits(QSerialPort::Data8);
        //Set StopBits
        Ports.setStopBits(QSerialPort::OneStop);

        //Set Parity
        Ports.setParity(QSerialPort::NoParity);

        //Set FlowControl
        Ports.setFlowControl(QSerialPort::NoFlowControl);

        //Attach Received Signal to correspond Slot function
        connect(&Ports,SIGNAL(readyRead()),this,SLOT(Receiver()));

    }
}

void MainWindow::on_Disconnect_clicked()
{
    Ports.close();
    ui->textBrowser->setTextColor(Qt::black);
    ui->textBrowser->append("Port DisConnected");

}

void MainWindow::on_RefreshPorts_clicked()
{
    ui->Ports->clear();

    QList<QSerialPortInfo> ports = info.availablePorts();
    QList<QString> stringPorts;
    for(int i = 0 ; i < ports.size() ; i++){
        stringPorts.append(ports.at(i).portName() + " " + ports.at(i).description());
//        stringPorts.append(ports.at(i).portName());
    }
    ui->Ports->addItems(stringPorts);

}

void MainWindow::on_Clear_clicked()
{
    ui->textBrowser->clear();
}

void MainWindow::on_Send_clicked()
{
    QString message = ui->lineEdit->text();
    ui->textBrowser->setTextColor(Qt::darkGreen); // Color of message to send is green.
    ui->textBrowser->append(message);
 //   qDebug() << message;
    Message = 1;
    Ports.write(message.toUtf8());
    while(Message)
    {
        QCoreApplication::processEvents();
    }
}

// SPI function
void MainWindow::on_pB_SpiTest_clicked()
{
    QString param1String = QString::number(param1).rightJustified(3,'0');
    QString param2String = QString::number(param2).rightJustified(3,'0');
    QString param3String = QString::number(param3).rightJustified(3,'0');

    QString message = SPI_SEND_HEAD+QString(param1String).arg(param1String,3)+param2String+param3String;   // e.g. $ s 1 001002003
    qDebug() << message;
    ui->textBrowser->setTextColor(Qt::black); // Color of message to send is green.
    ui->textBrowser->append("Start SPI send test");
    Message = 1;
    Ports.write(message.toUtf8());
    while(Message)
    {
        QCoreApplication::processEvents();
    }

}


void MainWindow::Receiver()
{
    //Process Regular Message respond
    if(Message)
    {
        QByteArray Rec = Ports.readAll();
        while (Ports.waitForReadyRead(250))
        {
            Rec.append(Ports.readAll());
        }

        ui->textBrowser->setTextColor(Qt::blue);        //Respond message is presented in blue
        ui->textBrowser->append("===========ZYNQ PS Respond===========");
        ui->textBrowser->append(QString(Rec));
        Rec.clear();
        Message = 0;
        return;
    }
    else if(StartSample)  //Process SPI Request
    {
        QByteArray Rec = Ports.readAll();
        while (Ports.waitForReadyRead(250))
        {
            Rec.append(Ports.readAll());
        }

        if(QString(Rec) == "SPI test done\n")           //SampleDone flag, sent by mcu through serial port
        {
            ui->textBrowser->setTextColor(Qt::black);        //Respond message is presented in blue
            ui->textBrowser->append("SPI test done");
            Rec.clear();
            StartSample = 0;
            return;
        }
        else
        {
            ui->textBrowser->append("Something wrong with SPI function");
            ui->textBrowser->append(QString(Rec));
            Rec.clear();
            return;
        }
    }

    return;
}

// LED function
void MainWindow::on_pB_LightOn_clicked()
{
    QString message = LED_ON;
    ui->textBrowser->setTextColor(Qt::black); // Color of message to send is green.

    ui->textBrowser->append("The LED has been turned on.");
    StartSample = 1;
    Ports.write(message.toUtf8());
    while(StartSample)
    {
        QCoreApplication::processEvents();
    }

}

void MainWindow::on_pB_LightOff_clicked()
{
    QString message = LED_OFF;
    ui->textBrowser->setTextColor(Qt::black); // Color of message to send is green.

    ui->textBrowser->append("The LED has been turned off.");
    StartSample = 1;
    Ports.write(message.toUtf8());
    while(StartSample)
    {
        QCoreApplication::processEvents();
    }
}

