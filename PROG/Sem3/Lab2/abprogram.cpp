#include "abprogram.h"
#include "ui_abprogram.h"

Abprogram::Abprogram(QWidget *parent) :
	QDialog(parent),
	ui(new Ui::Abprogram)
{
	ui->setupUi(this);

	connect(ui->pushButton, SIGNAL(clicked()), this, SLOT(accept()));
}

Abprogram::~Abprogram()
{
	delete ui;
}

void Abprogram::changeEvent(QEvent *e)
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
