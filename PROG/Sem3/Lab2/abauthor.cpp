#include "abauthor.h"
#include "ui_abauthor.h"

Abauthor::Abauthor(QWidget *parent) :
	QDialog(parent),
	ui(new Ui::Abauthor)
{
	ui->setupUi(this);

	connect(ui->pushButton, SIGNAL(clicked()), this, SLOT(accept()));
}

Abauthor::~Abauthor()
{
	delete ui;
}

void Abauthor::changeEvent(QEvent *e)
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
