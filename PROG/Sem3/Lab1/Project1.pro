#-------------------------------------------------
#
# Project created by QtCreator 2016-09-06T12:40:09
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Project1
TEMPLATE = app


SOURCES += main.cpp\
		mainwindow.cpp \
	about.cpp \
	author.cpp \
    zastavka.cpp

HEADERS  += mainwindow.h \
	about.h \
	author.h \
    zastavka.h

FORMS    += mainwindow.ui \
	about.ui \
	author.ui \
    zastavka.ui

TRANSLATIONS += lang_en.ts lang_ru.ts

CODEC += UTF-8

RESOURCES     = res.qrc
