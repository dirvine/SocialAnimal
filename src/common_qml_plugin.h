
#ifndef COMMON_QML_PLUGIN_H
#define COMMON_QML_PLUGIN_H

#include "maidsafe/common/crypto.h"
#include "maidsafe/common/utils.h"
#include "maidsafe/common/rsa.h"

#include <QObject>
#include <QtQml/qqml.h>

class FreedomCryptModel : public QObject {
  Q_OBJECT
public:
  explicit FreedomCryptModel(QObject* parent = 0)
    : QObject(parent){}
 Q_INVOKABLE int CpuSize() {
    return maidsafe::CpuSize();
  }
  Q_INVOKABLE QString RandomString(const int& size) {
       return QString::fromStdString(maidsafe::RandomAlphaNumericString(static_cast<size_t>(size)));
  }
  private:
  maidsafe::rsa::Keys keys_;

};

// see here http://stackoverflow.com/questions/9500280/qt-access-c-function-from-qml
//http://ruedigergad.com/2011/11/13/exchange-data-and-objects-between-c-and-qml-and-vice-versa/
#endif // COMMON_QML_PLUGIN_H
