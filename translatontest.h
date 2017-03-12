#ifndef TRANSLATONTEST_H
#define TRANSLATONTEST_H
#include <QtGui>

class TranslationTest : public QObject
{
 Q_OBJECT
 Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

 public:
  TranslationTest() {
   translator1 = new QTranslator(this);
  }

  QString getEmptyString() {
   return "";
  }

 Q_INVOKABLE void selectLanguage(QString language) {
  if(language == QString("ru")) {
   translator1->load(":/QmlLanguage_ru", ".");
   qApp->installTranslator(translator1);
  }

//  if(language == QString("sp")) {
//   translator2->load("t1_sp", ".");
//   qApp->installTranslator(translator2);
//  }

  if(language == QString("en")) {
   qApp->removeTranslator(translator1);
  }

  emit languageChanged();
 }

 signals:
  void languageChanged();

 private:
  QTranslator *translator1;
};

#endif // TRANSLATONTEST_H
