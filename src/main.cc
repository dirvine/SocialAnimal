#include <QtWidgets/QApplication>
#include <QtQml>
#include <QtQuick/QQuickView>

#include "maidsafe/common/log.h"
#include "common_qml_plugin.h"

int main(int argc, char *argv[]) {

    QApplication::setOrganizationName("MaidSafe");
    QApplication::setOrganizationDomain("maidsafe.net");
    QApplication::setApplicationName("FreedomCrypt");
    QApplication::setApplicationVersion("0.1.0");
    QApplication::setStyle("fusion");

    QApplication app(argc, argv);
    qmlRegisterType<FreedomCryptModel>("FreedomCrypt",
                                       1,
                                       0,
                                       "FreedomCryptModel");
    try {
         int rc = 0;

         QQmlEngine engine;
         QQmlComponent *component = new QQmlComponent(&engine);

         QObject::connect(&engine, SIGNAL(quit()), QCoreApplication::instance(), SLOT(quit()));

         component->loadUrl(QUrl("qrc:/qml/Main.qml"));

         if (!component->isReady() ) {
             qWarning("%s", qPrintable(component->errorString()));
             return -1;
         }

         QObject *topLevel = component->create();
         QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

         QSurfaceFormat surfaceFormat = window->requestedFormat();
         window->setFormat(surfaceFormat);
         window->show();

         rc = app.exec();

         delete component;
         return rc;

    } catch(const std::exception &ex) {
      LOG(kError) << "STD Exception Caught: " << ex.what();
      return -1;
    } catch(...) {
      LOG(kError) << "Default Exception Caught";
      return -1;
    }
}

