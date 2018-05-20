#include "warning.h"
#include "ui_warning.h"

Warning::Warning(QWidget *parent) :
	QDialog(parent),
	ui(new Ui::Warning)
{
	ui->setupUi(this);

	connect(ui->pushButton, SIGNAL(clicked()), this, SLOT(accept()));
}

Warning::~Warning()
{
	delete ui;
}

void Warning::changeEvent(QEvent *e)
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

void Warning::sltText(QString str)
{
	ui->label->setText(str);
}
