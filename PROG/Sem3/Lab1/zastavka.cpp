#include "zastavka.h"
#include "ui_zastavka.h"

Zastavka::Zastavka(QWidget *parent) :
	QDialog(parent),
	ui(new Ui::Zastavka)
{
	ui->setupUi(this);
}

Zastavka::~Zastavka()
{
	delete ui;
}

void Zastavka::changeEvent(QEvent *e)
{
	QDialog::changeEvent(e);
	switch (e->type()) {
		case QEvent::LanguageChange:
			ui->retranslateUi(this);
			break;
		default:
			break;
	}
}

void Zastavka::on_pushButton_clicked()
{
	Zastavka::accept();
}
