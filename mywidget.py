# sample dialog 
# see https://wiki.freecadweb.org/Dialog_creation
# to use:
# import mywidget
# myDialog = mywidget.createMove()

from PySide import QtCore, QtGui
import FreeCAD
import CaptureFC 

class Ui_Dialog(object):
   def setupUi(self, Dialog):
       Dialog.setObjectName("Dialog")
       Dialog.resize(187, 178)
       self.title = QtGui.QLabel(Dialog)
       self.title.setGeometry(QtCore.QRect(10, 10, 271, 16))
       self.title.setObjectName("title")
       self.label_xlabel = QtGui.QLabel(Dialog)
       self.label_xlabel.setGeometry(QtCore.QRect(10, 50, 57, 16))
       self.label_xlabel.setObjectName("label_x")
       self.label_ylabel = QtGui.QLabel(Dialog)
       self.label_ylabel.setGeometry(QtCore.QRect(10, 90, 57, 16))
       self.label_ylabel.setObjectName("label_y")
       self.xpos = QtGui.QLineEdit(Dialog)
       self.xpos.setGeometry(QtCore.QRect(60, 40, 111, 26))
       self.xpos.setObjectName("pos_x")
       self.ypos = QtGui.QLineEdit(Dialog)
       self.ypos.setGeometry(QtCore.QRect(60, 80, 111, 26))
       self.ypos.setObjectName("Pos_y")
       self.create = QtGui.QPushButton(Dialog)
       self.create.setGeometry(QtCore.QRect(50, 140, 83, 26))
       self.create.setObjectName("create")

       self.retranslateUi(Dialog)
       QtCore.QObject.connect(self.create,QtCore.SIGNAL("pressed()"),self.createMove)
       QtCore.QMetaObject.connectSlotsByName(Dialog)

   def retranslateUi(self, Dialog):
       Dialog.setWindowTitle("Dialog")
       self.title.setText("GCode Move")
       self.label_xlabel.setText("X Position")
       self.label_ylabel.setText("Y Position")
       self.create.setText("Create!")

   def createMove(self):
       try:
           # first we check if valid numbers have been entered
           x = float(self.xpos.text())
           y = float(self.ypos.text())
       except ValueError:
           print("Error! X  and Y values must be valid numbers!")
       else:
           # Send entry to editor 
           gcodeln = 'G1 X' +  self.xpos.text() + ' Y' + self.ypos.text()       
           CaptureFC.WrtArgs('user1',gcodeln,'','','','','','','','','')


class createMove():
  def __init__(self):
      self.d = QtGui.QWidget()
      self.ui = Ui_Dialog()
      self.ui.setupUi(self.d)
      self.d.show()