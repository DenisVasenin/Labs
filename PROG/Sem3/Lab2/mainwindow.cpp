#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);

	au = new Abauthor;
	ap = new Abprogram;
	wr = new Warning;
	date = QDateTime::currentDateTime().toString("[dd.MM.yy hh:mm:ss]");

	QActionGroup *actLang = new QActionGroup(this);
	actLang->addAction(ui->act_en);
	actLang->addAction(ui->act_ru);
	connect(actLang, SIGNAL(triggered(QAction*)), this, SLOT(SetLang(QAction*)));

	connect(ui->act_esc, SIGNAL(triggered()), this, SLOT(close()));
	connect(ui->act_aut, SIGNAL(triggered()), au, SLOT(show()));
	connect(ui->act_prog, SIGNAL(triggered()), ap, SLOT(show()));

	connect(this, SIGNAL(sigText(QString)), wr, SLOT(sltText(QString)));


	log.setFileName("log.txt");
	if (!log.open(QIODevice::Append)) {
		str = tr("Ошибка открытия файла ") + log.fileName();
		emit sigText(str);
		wr->show();
	} else {
		stream.setDevice(&log);
		str = date + tr(" Программа запущена\n");
		stream << str;
		str = date + tr(" Файл лога успешно открыт\n");
		stream << str;
	}
}

MainWindow::~MainWindow()
{
	str = date + tr(" Программа зарыта\n");
	stream << str;
	delete ui;
}

void MainWindow::SetLang(QAction *act)
{
	if (act->text() == "English") {
		l_translator.load("en.qm");
	}
	if (act->text() == "Русский") {
		l_translator.load("ru.qm");
	}
	qApp->installTranslator(&l_translator);
}

//void MainWindow::changeEvent(QEvent *e)
//{
//	//QMainWindow::changeEvent(e);
//	switch (e->type()) {
//		case QEvent::LanguageChange:
//			ui->retranslateUi(this);
//			break;
//		case QEvent::Close:
//			ap->close();
//			au->close();
//		default:
//			break;
//	}
//}
///////////////////////////////////////////////////////
void MainWindow::changeEvent(QEvent *event)
{
	if(event->type() == QEvent::LanguageChange)
	{
		ui->retranslateUi(this);
	}
	QMainWindow::changeEvent(event);
}

void MainWindow::closeEvent(QCloseEvent *event)
{
	if (event->type() == QEvent::Close) {
		ap->close();
		au->close();
	}
}

////////////////////////////////////////////////////////

void MainWindow::on_toolButton_clicked()
{
	ui->textEdit->clear();
	str = QFileDialog::getOpenFileName(0, tr("Выберите файл"), "", "*.c");
	file.setFileName(str);
	if (!file.open(QIODevice::ReadWrite | QIODevice::Text)) {
		str = tr("Ошибка открытия файла ") + file.fileName();
		emit sigText(str);
		wr->show();
		if (log.isOpen()) {
			str = date + tr(" Ошибка открытия файла ") + file.fileName() + "\n";
			stream << str;
		}
	} else {
		if (log.isOpen()) {
			str = date + tr(" Файл ") + file.fileName() + tr(" успешно открыт\n");
			stream << str;
		}
	}
}

void MainWindow::on_pushButton_clicked()
{
	ui->textEdit->clear();
	if (file.isOpen()) {
		reg.setPattern("(?:[^//])(\\b(int|float|double|char)\\b\\s+.+;?)");
		reg1.setPattern("\\b(int|float|double|char)\\b\\s+.+;?");
		reg2.setPattern("(?:[^'])(\\b[A-Z|a-z|_]\\w*\\b)(\\s*(,|;|$|=|\\)|\\[))");
		count = 0;
		ui->textEdit->insertPlainText(tr("Переменные:\n"));
		while (!file.atEnd()) {
			str = file.readLine();
			pos = reg.indexIn(str);
			if (pos != -1) {
				str = reg.cap(1);
				//ui->textEdit->insertPlainText(str + "\n");
				list = str.split(";", QString::SkipEmptyParts);
				for (lcount = 0; lcount < list.count(); lcount++) {
					pos = reg1.indexIn(list[lcount]);
					if (pos != -1) {
						str = reg1.cap(0);
						//ui->textEdit->insertPlainText(str + "\n");
						pos1 = 0;
						while (pos1 != -1) {
							pos1 = reg2.indexIn(str, pos1);
							if (pos1 != -1) {
								str1 = reg2.cap(1);
								//ui->textEdit->insertPlainText(str1 + "\n");
								if (str1 != "float" && str1 != "int" && str1 != "char" && str1 != "double") {
									//stream << date + tr(" Найдена переменная %1\n").arg(str1);
									ui->textEdit->insertPlainText(str1 + " ");
									count++;
								}
								pos1++;
							}
						}
					}
				}
			}
		}
		str = date + tr(" Количество переменных: %1 \n").arg(count);
		stream << str;
		ui->textEdit->insertPlainText(tr("\n\nКоличество: %1").arg(count));
		file.close();
		if (file.isOpen()) {
			str = date + tr(" Ошибка закрытия файла ") + file.fileName() + "\n";
			stream << str;
		} else {
			str = date + tr(" Файл ") + file.fileName() + " успешно закрыт\n";
			stream << str;
		}
	} else {
		ui->textEdit->insertPlainText(tr("Выберите файл с исходным кодом на С."));
	}
}


//pos += reg.matchedLength();
//stream << QString::number(count) + "\n";
//stream << QString::fromUtf8(tr("привет"));
