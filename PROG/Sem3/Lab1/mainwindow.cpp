#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);
	ui->TextEdit->setReadOnly("true");

	au = new Author;
	ab = new About;

///////////////////////////////////////// Перевод //////////////////////////////////////////////////////////

	QActionGroup *actLang = new QActionGroup(this);
	actLang->addAction(ui->act_eng);
	actLang->addAction(ui->act_rus);
	connect(actLang, SIGNAL(triggered(QAction*)), this, SLOT(SetLang(QAction*)));
	connect(ui->act_esc, SIGNAL(triggered()), this, SLOT(close()));
}

void MainWindow::SetLang(QAction *act)
{
	if (act->text() == "English") {
		l_translator.load("lang_en.qm");
	}
	if (act->text() == "Русский") {
		l_translator.load("lang_ru.qm");
	}
	qApp->installTranslator(&l_translator);
}

void MainWindow::changeEvent(QEvent *event)
{
	if(event->type() == QEvent::LanguageChange)
	{
		ui->retranslateUi(this);
	}
	QMainWindow::changeEvent(event);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void MainWindow::closeEvent(QCloseEvent *event)
{
	if (event->type() == QEvent::Close) {
		ab->close();
		au->close();
	}
}

MainWindow::~MainWindow()
{
	delete ui;
}

bool isDouble(const QString &String)
{
	QRegExp reg("^(\\d+\\.\\d+|\\d+)$");
	return reg.indexIn(String) != -1;
}

void MainWindow::on_pushButton_clicked()
{
	ui->TextEdit->clear();
	QString String1;
	double km, m;
	int ver, ar, sag;
	String1 = ui->LineEdit->text();
	if (!isDouble(String1)) ui->TextEdit->insertPlainText(tr("Введите положительное число."));
	else {
		km = String1.toDouble();
		ui->TextEdit->insertPlainText(tr("Километры: %1 \n").arg(String1));
		m = km * 1000;
		String1 = QString::number(m,'g',12);
		ui->TextEdit->insertPlainText(tr("Метры: %1 \n").arg(String1));
		ver = m / 2133.6;
		String1 = QString::number(ver);
		ui->TextEdit->insertPlainText(tr("Вёрсты: %1 \n").arg(String1));
		sag = (m - ver * 2133.6) / 2.1336;
		String1 = QString::number(sag);
		ui->TextEdit->insertPlainText(tr("Сажени: %1 \n").arg(String1));
		ar = (m - (ver * 2133.6 + sag * 2.1336)) / 0.7112;
		String1 = QString::number(ar);
		ui->TextEdit->insertPlainText(tr("Аршины: %1 \n").arg(String1));
	}
}

void MainWindow::on_act_author_triggered()
{
	au->show();
}

void MainWindow::on_act_about_triggered()
{
	ab->show();
}
