#include "mainwindow.h"
#include "mystring.h"

#include <QVBoxLayout>
#include <QLabel>
#include <QPointer>
#include <QScopedPointer>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    m_qpointerButton = new QPushButton("QPointer Test", this);
    m_qscopedPointerButton = new QPushButton("QScopedPointer Test", this);
    m_doNotPopupCheck = new QCheckBox("Do not popup", this);
    m_exceptionalReturnCheck = new QCheckBox("Exceptional return", this);

    connect(m_qpointerButton, SIGNAL(clicked()), this, SLOT(handleQPointerButton()));
    connect(m_qscopedPointerButton, SIGNAL(clicked()), this, SLOT(handleQScopedPointerButton()));

    QVBoxLayout *layout = new QVBoxLayout;
    layout = new QVBoxLayout;
    layout->addWidget(m_qpointerButton);
    layout->addWidget(m_qscopedPointerButton);
    layout->addWidget(m_doNotPopupCheck);
    layout->addWidget(m_exceptionalReturnCheck);

    QWidget *window = new QWidget;
    window->setLayout(layout);

    setCentralWidget(window);
}

MainWindow::~MainWindow()
{
}

void MainWindow::handleQPointerButton()
{
    QPointer<QLabel> label = new QLabel("The pointer of this label is QPointer.");
    qDebug() << "label was assigned:" << (void *)label;

    if (m_doNotPopupCheck->isChecked()) {
        delete label;
        qDebug() << "label was deleted:" << (void *)label;
    }

    if (label) {
        label->show();
    }
}

void MainWindow::handleQScopedPointerButton()
{
    QScopedPointer<MyString> myStr(new MyString("Hello, QScopedPointer!"));

    if (m_exceptionalReturnCheck->isChecked()) {
        qDebug() << "Exceptional return";
        return;
    }
    qDebug() << "Normal return";
    return;
}
