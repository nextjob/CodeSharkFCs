HelpScribble project file.
16
[rkgwbo `byhgvbaf Yyp-1ORN76
0
2




FALSE

C:\Delphi10_1_Projects\CodeSharkFC\Doc,C:\Delphi10_1_Projects\CodeSharkFCs_Help
1
BrowseButtons()
0
FALSE

FALSE
TRUE
16777215
0
16711680
8388736
255
FALSE
FALSE
FALSE
FALSE
150
50
600
500
TRUE
FALSE
1
FALSE
FALSE
Contents
%s Contents
Index
%s Index
Previous
Next
FALSE
C:\Delphi10_1_Projects\CodeSharkFCs_Help\WebHelp\CodeSharkFC.html
33
99
Scribble99
CodeSharkFCs




Writing



FALSE
46
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil\fcharset0 Cordia New;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red255\green0\blue0;\red0\green0\blue0;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 CodeSharkFCs
\par 
\par \cf0\b0\fs24 CodeSharkFCs is an open source editor for your CNC programs and communication software for your CNC controller.
\par CodeSharkFCs is also a FreeCAD intergration project. The current version provides a mechanism to export design geometry
\par  (points, lines, arcs, circle center points) into the editor window
\par \cf2\f1\fs36 
\par \fs32 THIS SOFTWARE IS PROVIDED BY THE AUTHOR  AND CONTRIBUTORS ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
\par 
\par IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
\par INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICTLIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
\par \cf3\fs36 
\par \fs20 This Program Is built with the following packages:
\par 
\par python4delphi, source code can be found here:
\par https://github.com/pyscripter/python4delphi
\par 
\par SynEdit, source code can be found here:
\par https://github.com/pyscripter/SynEdit-2
\par 
\par TurboPower Async Professional,  source code can be found here:
\par https://github.com/TurboPack/AsyncPro
\par \f0 
\par \f1 TurboPower Orpheusl,  source code can be found here:
\par \f0 https://github.com/TurboPack/Orpheus
\par 
\par FreeCad can be found here:
\par https://www.freecadweb.org/
\par 
\par This Program uses the path gereration scripts found in PathKurveUtils.py & Pathselection.py 
\par Copyright (c) 2015 Dan Falck <ddfalck@gmail.com>   https://github.com/FreeCAD/FreeCAD
\par \cf0\fs24 
\par 
\par \b\fs28 Important Notes:
\par 
\par \cf2\b0\fs24 CodeSharkFCs currently supports the 64bit  FreeCad version .19 
\par CodeSharkFCs may or may not interface properly with future version of FreeCad.
\par The FreeCad Path workbench is still in early stages of development.
\par TurboPack AsyncPro Win64 support is experimental! 
\par \cf0\b\f2\fs28 
\par \cf4\b0\f0\fs20\{bmc CodeSharkFCs.PNG\}
\par \cf0\f2 
\par \cf5\strike\f0\fs24 CodeSharkFCs Index\cf4\strike0\{linkID=100\}\f2\fs20 
\par \cf5\strike 
\par }
100
Scribble100
Home




Writing



FALSE
21
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Home\cf0\b0\f1\fs20 
\par 
\par \cf2\f0\fs24\{bmc CodeSharkFCs.PNG\}
\par \cf0\f1 
\par \ul\b\f0 FreeCAD\ulnone\b0\f1 
\par \cf3\strike FreeCad Setup\cf2\strike0\{linkID=200\}
\par \cf3\strike Start FreeCad\cf2\strike0\{linkID=300\}\cf0 
\par \cf3\strike Pick Geometry\cf2\strike0\{linkID=400\}
\par \cf3\strike Generate Path\f0  PathKurveUtils \cf2\strike0\f1\{linkID=500\}
\par \cf3\strike Path FromShapes\cf2\strike0\{linkID=510\}
\par \cf4\ul\b\f0 Serial Communication\cf2\ulnone\b0\f1 
\par \cf3\strike Settings\cf2\strike0\{linkID=600\}
\par \cf3\strike CNC\cf2\strike0\{linkID=700\}
\par \cf3\strike FreeCAD\cf2\strike0\{linkID=200\}
\par \cf3\strike Tools\cf2\strike0\{linkID=800\}
\par \cf3\strike G Code Templates\cf2\strike0\{linkID=900\}
\par \cf3\strike Trouble Shooting\cf2\strike0\{linkID=9000\}
\par \cf3\strike Serial Communications\cf2\strike0\{linkID=9010\}\cf0\fs20 
\par }
200
Scribble200
FreeCAD Setup




Writing



FALSE
46
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fnil\fcharset0 Courier New;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 FreeCAD Setup\cf0\b0\f1\fs20 
\par 
\par \f0\fs24 If not already present, install FreeCAD on the pc.
\par 
\par Open the CodeSharkFCs application
\par Select the FreeCAD menu item
\par 
\par \cf2\{bmc Memo1.png\}\cf0 
\par 
\par 
\par Select FreeCAD Settings from the sub menu.
\par 
\par \cf2\{bmc FCSettings1.png\}
\par 
\par \cf0 
\par 
\par CodeSharkFCs needs to know the path for the PythonHome environment variable (path to the Python directory, ususally ..\\FreeCad\\bin).
\par Click in the PythonHome Env Value text box to open the PythonHome  path selection dialog, then select the correct directory and click the Select Folder button.
\par \cf2 
\par \{bmc FCSettings2.png\}
\par 
\par \cf0 CodeSharkFCs needs to know the path to the FreeCad Mod (Modules) directory, ususally ..\\FreeCad\\Mod).
\par Click in the FreeCad Mod Path text box to open the FreeCad Mod  path selection dialog, then select the correct directory and click the Select Folder button.
\par \cf2 
\par \{bmc FCSettings3.png\}
\par 
\par \cf3 CodeSharkFCs needs to know the version of Python FreeCAD is using, select from the drop down list. Note this list is dependant on the Python versions know to Python4Delphi, if the version is not in the drop down list, CodeSharkFCs will need to be built with a new version of Python4Delphi.
\par 
\par \cf2\{bmc FCSettings3A.png\}
\par 
\par \cf0 CodeSharkFCs communicates with FreeCad via a set of Python scripts.  The default scripts are hardcoded into the CodeSharkFCs module. However the code allows for custom scripts to be implemented via the "Custom xxx Script" check boxes.  On the first execution of CodeSharkFCs the following scripts are written to the users %LOCALAPPDATA%\\CodeSharkFCs directory:
\par 
\par \f2 Custom Strart Script             - StartupScript.py
\par Custom View Panel Script         - PanelViewScript.py
\par Custom Selection Observer Script - ObserverScript.py
\par Custom Shutdown Script           - ShutdownScript.py\f0 
\par 
\par If the check box is marked CodeSharkFCs will use the the associated script to communicate with FreeCAD.
\par 
\par \cf2\{bmc FCSettings1b.png\}\cf0  
\par 
\par \cf4\strike Home\cf2\strike0\{linkID=100\}\cf0 
\par \f1\fs20 
\par }
300
Scribble300
Start FreeCAD




Writing



FALSE
38
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Start FreeCAD\cf0\b0\f1\fs20 
\par 
\par \f0\fs24 Open the CodeSharkFCs application
\par Select the FreeCAD menu item
\par 
\par \cf2\{bmc Memo1.png\}\cf0 
\par 
\par 
\par Select Run FreeCAD from the sub menu.
\par 
\par \cf2\{bmc FCRunFC1.png\}
\par 
\par \cf0 The FreeCAD Interface dialog is displayed.
\par 
\par \cf2\{bmc FCRunFC2.png\}
\par 
\par \cf0 Click the Run FreeCAD button.
\par 
\par \cf2\{bmc FCRunFC3.png\}
\par 
\par \cf0 The FreeCAD application starts with a blank project.  The panels that are visible on inital startup are specified by the script PanelViewScript.py.
\par 
\par \cf2\{bmc FCRunFC3a.png\}
\par 
\par \cf0 Use the FreeCAD File Menu item to open the desired drawing file.
\par 
\par \cf2\{bmc FCRunFC3b.png\}
\par 
\par \cf0 The drawing file is displayed.
\par 
\par \cf2\{bmc FCRunFC3c.png\}\cf0  
\par 
\par \cf3\strike FreeCAD Setup\cf2\strike0\{linkID=200\}\cf0 
\par 
\par \cf3\strike Home\cf2\strike0\{linkID=100\}\cf0\f1\fs20 
\par }
400
Scribble400
Pick Geometry




Writing



FALSE
27
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Pick Geometry
\par \cf0\fs24 
\par \b0 Currently CodeSharkFCs supports the following geometric entities:
\par 
\par Points
\par Lines
\par Arcs
\par Circles\b 
\par \b0 
\par With the Bypass Selection Import check box NOT checked, CodeSharkFCs will write the coordinates of the selected geometry to the editor window.
\par 
\par \cf2\{bmc FCRunFC3c1.png\}\cf0 
\par 
\par Selecting a supported geometric entitie results in it's geometry being entered into the editor window.
\par 
\par \cf2\{bmc FCRunFC3d.png\}
\par 
\par \{bmc FCRunFC3d2.png\}
\par 
\par \cf3\strike FreeCAD Setup\cf2\strike0\{linkID=200\}
\par 
\par \cf3\strike Home\cf2\strike0\{linkID=100\}\cf0\f1\fs20 
\par 
\par 
\par }
500
Scribble500
Generate Path




Writing



FALSE
59
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}{\f2\fnil\fcharset0 Courier New;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Generate Path
\par 
\par \cf0\b0\f1\fs24 CodeSharkFCs uses the PathKurveUtils functions (found in ..\\FreeCAD\\Mod\\Path\\PathScripts\\PathKurveUtils.py) to generate simple CNC profile paths.
\par 
\par These functions were written by Dan Falck, the Copyright notice is provide below:
\par 
\par \f2 # ***************************************************************************
\par # *                                                                         *
\par # *   Copyright (c) 2015 Dan Falck <ddfalck@gmail.com>                      *
\par # *                                                                         *
\par # *   This program is free software; you can redistribute it and/or modify  *
\par # *   it under the terms of the GNU Lesser General Public License (LGPL)    *
\par # *   as published by the Free Software Foundation; either version 2 of     *
\par # *   the License, or (at your option) any later version.                   *
\par # *   for detail see the LICENCE text file.                                 *
\par # *                                                                         *
\par # *   This program is distributed in the hope that it will be useful,       *
\par # *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
\par # *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
\par # *   GNU Library General Public License for more details.                  *
\par # *                                                                         *
\par # *   You should have received a copy of the GNU Library General Public     *
\par # *   License along with this program; if not, write to the Free Software   *
\par # *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  *
\par # *   USA                                                                   *
\par # *                                                                         *
\par # ***************************************************************************
\par # PathKurveUtils - functions needed for using libarea (created by Dan Heeks) for making simple CNC profile paths 
\par 
\par 
\par \f1 To generate a tool path first check the  Bypass Selection Import  check box .  This prevents  CodeSharkFCs from writing  the coordinates of the selected geometry to the editor window.
\par 
\par \cf2\{bmc FCRunFC4.png\}\cf0 
\par 
\par Next set the tool parameters.
\par 
\par \cf2\{bmc FCRunFC5.png\}\cf0 
\par 
\par Select the geometric entities that make up the profile.  The entities must be connected within the tolerances established in FreeCAD.
\par The Selected Edge Count will increment with each edge selection
\par 
\par \cf2\{bmc FCRunFC5a.png\}\cf0 
\par 
\par Once the profile has been selected click the Path by PathKurveUtils button.  The CNC profile path is created and written to the editor window.
\par 
\par \cf2\{bmc FCRunFC6.png\}\cf0 
\par 
\par  TBC
\par - Create some sort of post processor mechanism
\par - Display Path   
\par 
\par \cf3\strike FreeCAD Setup\cf2\strike0\{linkID=200\}\cf0 
\par 
\par \cf3\strike Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par 
\par 
\par }
510
Scribble510
Path FromShapes




Writing



FALSE
33
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fswiss\fcharset0 Arial;}{\f3\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Path FromShapes\cf0\b0\f1\fs20 
\par 
\par  NOTES\f0 :\f1    
\par  This tool generates tool-paths from Path Object edges. Tool-paths are uncompensated for tool radius.
\par  \f0  See: \f1 https://wiki.freecadweb.org/Path_FromShapes/en
\par 
\par  Path.fromShapes(shapes, start=Vector(), return_end=False arc_plane=1, sort_mode=1, min_dist=0.0, abscissa=3.0,
\par     nearest_k=3, orientation=0, direction=0, threshold=0.0, retract_axis=2, retraction=0.0, resume_height=0.0,
\par    segmentation=0.0, feedrate=0.0, feedrate_v=0.0, verbose=true, abs_center=false, preamble=true, deflection=0.01)
\par 
\par 
\par \f0\fs24 To generate a tool path first check the  Bypass Selection Import  check box .  This prevents  CodeSharkFCs from writing  the coordinates of the selected geometry to the editor window.
\par 
\par \pard\sb100\sa100 Then select the Set Tool button and \f2  set the tool parameters (only Tool Direction and FromShape XYZ are used).\f3 
\par \pard\f1\fs20 
\par \cf2\{bmc FCRunFC8.png\}
\par 
\par \pard\sb100\sa100\cf0\f2\fs24 Select the geometric entities that make up the profile. The entities must be connected within the tolerances established in FreeCAD.\f3 
\par \f2 The Selected Edge Count will increment with each edge selection\f3 
\par \pard\cf2\f1\fs20 
\par 
\par \{bmc FCRunFC9.png\}
\par 
\par \cf0\f0\fs24 Once the profile has been selected click the Path by FromShapes button.  The CNC profile path is created and written to the editor window.\cf2\f1\fs20 
\par 
\par \{bmc FCRunFC10.png\}
\par 
\par \cf3\strike\fs24 Start FreeCAD\cf2\strike0\{linkID=300\}\fs20 
\par 
\par \cf3\strike\f0\fs24 Home\cf2\strike0\{linkID=100\}\cf0\f1\fs20 
\par }
600
Scribble600
Settings




Writing



FALSE
18
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Settings
\par 
\par \cf2\b0\f1\fs24 The Setting Menu contains dialogs for Font selection and General Program settings along with access to various communication logs.
\par \cf1\b\f0\fs32 
\par \cf3\{bmc ProgramSettings.png\}\cf1 
\par \fs24 
\par \cf4\b0\strike Select Font\cf3\{linkID=610\}\b\strike0 
\par 
\par \cf4\b0\strike Program Settings\cf3\{linkID=620\}
\par 
\par \b\strike0 
\par \cf4\b0\strike\f1 Home\cf3\strike0\{linkID=100\}\b\f0 
\par \cf0\b0\fs20 
\par 
\par 
\par }
610
Scribble610
Select Font




Writing



FALSE
13
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Select Font
\par \cf0\b0\fs20 
\par 
\par \f1\fs24 The Font Selection Dialog allows changes to the Editor window font.
\par \f0\fs20 
\par \cf2\b\fs32\{bmc FontSettings\f1 2\f0 .png\}
\par \cf3\b0\strike\f1\fs24 
\par Settings\cf2\strike0\{linkID=600\}
\par \b\f0\fs32 
\par \cf3\b0\strike\f1\fs24 Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
620
Scribble620
Program Settings




Writing



FALSE
19
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Program Settings
\par 
\par \cf2\b0\f1\fs24 The Program Settings Dialog contains two tabs. Editor Options Tab for various editor functions and 
\par a Misc Tab for access to various communication logs and the Test Terminal.\cf1\b\f0\fs32 
\par 
\par \cf3\fs24\{bmc ProgramSettings1.PNG\}\cf1 
\par \cf0\b0 
\par 
\par \cf3\b\{bmc ProgramSettings2.PNG\}
\par 
\par \cf4\b0\strike\f1 Editor Options\cf3\strike0\{linkID=622\}\cf4 
\par \strike\f0 Misc\cf3\strike0\{linkID=624\}
\par \cf4\strike 
\par \f1 Settings\cf3\strike0\{linkID=600\}\b\f0 
\par \cf4\b0\strike\f1 
\par Home\cf3\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
622
Scribble622
Editor Options Tab




Writing



FALSE
24
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Editor Options Tab\cf0\b0\f1\fs20 
\par 
\par \cf2\b\fs24\{bmc ProgramSettings1.PNG\}
\par 
\par \cf3\b0\f0 Gutter Checkbox - Display Gutter in editor window.
\par 
\par Line Numbers On Gutter  Checkbox - Display Line Numbers in Gutter.
\par 
\par Defaul File Extension - Drop down list used to select default file extension used on file open and file save operations.\cf4\strike\f1 
\par 
\par \cf3\strike0\f0 File Filter - results in the automatic removal of control codes, nulls and blank lines from the CNC source code file at: file open, file send and after file receive.
\par 
\par Add % - results in the File Filter option adding the % sign to the beginning and end of the CNC source code file at: file open, file send and after file receive.
\par 
\par Clear 1st Block to % - results in the File Filter option removing all characters in the CNC source code file from the start of the file up to the beginning % sign.
\par 
\par Remove Spaces - results in the File Filter option also removing all spaces (except in comments) from the CNC source code file at: file open, file send and after file receive.
\par \cf4\strike\f1 
\par \f0 Settings\cf2\strike0\{linkID=600\}\b\f1 
\par \cf4\b0\strike\f0 
\par Home\cf2\strike0\{linkID=100\}\cf0\f1\fs20 
\par }
624
Scribble624
Misc Tab




Writing



FALSE
18
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Misc Tab
\par 
\par \cf2\f1\fs24\{bmc ProgramSettings2.PNG\}\cf1\f0\fs32 
\par \cf0\b0\f1\fs20 
\par \cf3\f0\fs24 The Misc Tab provides access to the Test Terminal, Transmission History Log file,
\par  the option to generate a Trace File and the ability to view the last generated Trace File.\cf0\f1\fs20 
\par 
\par \cf4\strike\fs24 Test Terminal\cf2\{linkID=625\}\cf0\fs20 
\par \cf4\fs24 History Log\cf2\{linkID=635\}
\par \cf4 Trace Log\cf2\{linkID=645\}
\par 
\par \cf4 
\par \f0 Settings\cf2\strike0\{linkID=600\}\b\f1 
\par \cf4\b0\strike\f0 
\par Home\cf2\strike0\{linkID=100\}\cf0\f1\fs20 
\par }
625
Scribble625
Test Terminal




Writing



FALSE
12
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\froman\fcharset0 Times New Roman;}{\f3\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Test Terminal\cf0\b0\fs20 
\par 
\par \cf2\{bmc TestTerm.PNG\}\cf0 
\par 
\par \pard\sb100\sa100\cf3\f1\fs24 The Test Terminal window is helpful in debugging communications problems. The window will display characters received by the setup com port. Characters typed from the PC keyboard are sent to the device connected to the setup com port. The terminal window displays the com port settings as well as status lights for the RS232 flow control signals. \f2 
\par \pard\cf4\strike\f0 
\par \f3 Settings\cf2\strike0\{linkID=600\}\b\f0 
\par \cf4\b0\strike\f3 
\par Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
635
Scribble635
History Log




Writing



FALSE
12
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fnil\fcharset0 Arial;}{\f3\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 History Log
\par \cf0\b0\fs20 
\par \cf2\{bmc HistoryFile.PNG\}\cf0 
\par \cf2\fs24 
\par \pard\sb100\sa100\cf0\f1 Selecting  - View History File opens the Notepad editor with the \cf3\f2 Transmission History Log file\cf0\f1 .\f3 
\par \pard\cf4\strike\f0 
\par \f2 Settings\cf2\strike0\{linkID=600\}\b\f0 
\par \cf4\b0\strike\f2 
\par Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
645
Scribble645
Trace Log




Writing



FALSE
16
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Trace Log\cf0\b0\fs20 
\par 
\par \cf2\fs24\{bmc TraceFile.PNG\}
\par 
\par \cf3\f1 Checking - Enable Dispatcher Tracing tells the communication software (AsyncPro) to generate a Dispatcher Trace log file.\cf2\f0 
\par \cf0\f2 Selecting  - View Trace File opens the Notepad editor with the latest Trace\cf3\f1  Log file\cf0\f2 .
\par 
\par More information on the contents and meaning of the data output to the Dispatcher Trace Log file can be found in the \cf2\f0 
\par \cf0\f1 AsyncPro Reference guide: \b\fs28  \b0\f0\fs24 http://tpapro.sourceforge.net/docs/APRO_ReferenceGuide.pdf\cf4\strike 
\par \f1 
\par Settings\cf2\strike0\{linkID=600\}\b\f0 
\par \cf4\b0\strike\f1 
\par Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
700
Scribble700
CNC




Writing



FALSE
13
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 CNC
\par 
\par \cf2\b0\{bmc CNC.PNG\}\cf1\b 
\par 
\par \cf3\b0\strike\fs24 Configure Port\cf2\{linkID=710\}
\par \cf3 Protocol Options\cf2\{linkID=720\}
\par \cf3 Send Program to CNC\cf2\strike0\{linkID=730\}\cf0\fs20 
\par \cf3\strike\fs24 Receive Program from CNC\cf2\strike0\{linkID=750\}
\par \cf0\fs20 
\par \cf3\strike\f1\fs24 Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
710
Scribble710
Configure Port




Writing



FALSE
48
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\froman\fcharset0 Times New Roman;}{\f3\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Configure Port\cf0\b0\fs20 
\par 
\par \cf2\fs24\{bmc ConfigPort2.png\}
\par \cf3 
\par ComPorts is a drop down list of all communication ports found by the windows operating system on the pc.
\par Select the communication port that is connected to your Machine Tool or Switch Box.
\par 
\par Baud Rates radio buttons select the baud rate used by the port.
\par 
\par Parity radio buttons select the parity checking mode of the port.
\par 
\par Data Bits radio buttons select the number of data bits expected / sent from the port.
\par 
\par Stop Bits radio buttons select the number of stop bits expected / sent from the port.
\par 
\par Flow Control refers to the ability of either end of a communications link to control the rate of data it is receiving.
\par Flow control is required when CodeShark and the connected CNC Machine Tool have different speeds for handling data internally.
\par 
\par Hardware Flow Control Options:
\par 
\par DTR/DSR: Flow Control uses the "data terminal ready" signal (DTR) / and "data set ready" signal (DSR).
\par 
\par RTS/CTS: Flow Control uses the "request to send" signal (RTS) / and "clear to send" signal (CTS). 
\par 
\par Software Flow Control Options:
\par 
\par Software Transmit flow control checked: CodeShark stops transmitting whenever it receives an XOff character from the CNC Machine Tool.
\par CodeShark will resume transmitting once it receives an XOn character from the CNC Machine Tool.
\par 
\par Software Receive flow control checked: CodeShark sends an XOff character to the CNC Machine Tool when its input buffer reaches a level at which
\par it cannot process any more incoming data. The CNC Machine Tool must recognize this character and stop sending data after it is received.
\par Once the input buffer reaches a level at which it can handle more data, the XON character is sent to the CNC Machine Tool.
\par 
\par Xon Char: the ASCII character code for XON normally set to 17.
\par 
\par Xoff Char: the ASCII character code for XOFF normally set to 19.
\par \cf2 
\par \pard\sb100\sa100\cf0\f1 More information on the above settings can be found in the AsyncPro Reference Guide. 
\par \cf4\strike AysncPro Documentation \cf2\strike0\{linkID=9005\}\cf0 
\par \f2 
\par \pard\f0\fs20 
\par \cf4\strike\f3\fs24 
\par CNC\cf2\strike0\{linkID=700\}\cf4\strike 
\par 
\par Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
720
Scribble720
Protocol Options




Writing



FALSE
75
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fswiss\fprq2\fcharset0 Arial;}{\f2\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Protocol Options\cf0\b0\fs20 
\par 
\par \cf2\fs24\{bmc Protocol.PNG\}
\par 
\par \cf3\f1 ASCII File Transfer Protocol*:
\par 
\par The term ASCII protocol is a bit of a misnomer, because in an ASCII transfer neither side of
\par the link is following well-documented rules. An ASCII protocol is really just a convenient
\par way of transmitting a text file.
\par 
\par It is difficult for the receiver to know when an ASCII transfer is over because there is no
\par agreed-upon method for indicating termination. The ASCII protocol terminates on any of
\par three conditions: when it receives a ^Z character, when it times out waiting for more data, or
\par when the user aborts the protocol.
\par 
\par The following parameters control the ASCII protocol:
\par 
\par Inter Character Delay
\par Determines the number of seconds or ticks to delay between characters during an ASCII file
\par transfer.  Usaully set to 0.
\par 
\par Inter Line Delay
\par Determines the number of seconds or ticks to delay between lines during an ASCII file transfer.
\par Usually set to 0.
\par 
\par Delay in Seconds or Ticks
\par Specify whether the value given for Inter Character Delay and Inter Line Delay is in Ticks or Seconds.
\par A Tick is the time unit used by the communication software (ASYNC Professional).  Accounding to the ASYNC Pro documentation it roughly equates to 1/18 of a second.
\par However, this seems to be system dependant. End user testing may (will) be required to determine actual value required.
\par 
\par Ascii EOF Timeout
\par Determines the number of seconds before an ASCII transfer is automatically terminated.
\par Because most text files are terminated by a ^Z character (ASCII 26), the ASCII protocol
\par closes the file and ends the protocol when it finds a ^Z. If the received file isn't terminated by
\par a ^Z, the ASCII protocol determines the file was completely received after a specified
\par number of seconds elapse without receiving any new data. 
\par 
\par Close Port Timeout
\par The number of seconds to delay the actual closing of the communication port in use after the ASCII protocol signals 
\par transmission complete ON THE CODESHARK side of the communication stream.  Some serial port servers (ie Ethernet to Serial devices) require this 
\par timer to prevent port closer from terminating serial transmission from the actual serial device to the receiving device.
\par Usually set to 5. 
\par 
\par CR Translation / LF Translation
\par Computer systems sometimes use different character sequences to terminate each line of a
\par text file. Most PC software stores both a carriage return <CR> and a line feed <LF> at the
\par end of each line. Other systems store only <LF> or only <CR> at the end of each line.
\par The ASCII protocol provides a number of options for translating from one end-of-line
\par sequence to another, both when transmitting and when receiving. When performing these
\par translations, the <CR> and <LF> characters are treated separately, based on the values
\par assigned to the CR Translation and LF Translation.
\par 
\par CR translation determines the end-of-line translation mode for carriage returns <CR>, possible selections include:
\par None:  the default, do not modify the character.
\par Strip:  strip the character from the data stream
\par Add LF after CR:  adds a line feed character <LF> after each <CR>. 
\par Add CR before LF: currently treated as None.
\par 
\par LF translation determines the end-of-line translation mode for line feeds <LF>, possible settings include:
\par None:  the default, do not modify the character
\par Strip:  strip the character from the data stream
\par Add CR before LF:  insert a <CR> before each <LF>. 
\par Add LF after CR: treated as None.
\par 
\par 
\par * Information displayed here taken from the Async Professional 4 Reference Guide, available from: 
\par \cf4\strike AysncPro Documentation \cf2\strike0\{linkID=9005\}\cf0\f0 
\par \fs20 
\par 
\par \cf4\strike\f2\fs24 CNC\cf2\strike0\{linkID=700\}
\par \cf4\strike 
\par Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
730
Scribble730
Send Program to CNC




Writing



FALSE
30
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}{\f2\fswiss\fprq2\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Send \f1 Program to CNC
\par \cf2\b0\fs28 
\par \f0\fs24\{bmc CNC.PNG\}
\par \f1\fs28 
\par \pard\nowidctlpar\cf3\f2\fs24 Selecting Send From Editor sends the CNC file in the editor window  to your CNC Machine Tool. 
\par 
\par Selecting Send From File opens a file dialog where you can select a file to send to your CNC Machine Tool.
\par 
\par On a File Send operation, CodeShark  presents a dialog which allows for communication settings to be changed. 
\par Selecting Send performs the file transfers in background, allow you to use CodeShark to perform other tasks.
\par 
\par Note: Some Controls require that the panel-edit switch be on in order to receive a program from a computer.\fs28 
\par \pard\cf0\f0 
\par \pard\nowidctlpar\cf2\f1\fs24\{bmc SendFile.PNG\}\cf0\f2\fs28 
\par \pard\f1  
\par \f2\fs24 During file send a window is displayed showing the status of the current transfer\fs28 .\fs20 
\par \cf2\f0 
\par \f1\fs24\{bmc SendingFile.PNG\}
\par 
\par \cf3 Once CodeShark is notifed by AsyncPro that the transmission is complete, the Port Close Timer begins its count down. 
\par The reason for this timer is explained \cf4\strike here\cf2\strike0\{linkID=9010\}
\par 
\par \{bmc PortCloseTimer.PNG\}\cf1\b\fs32 
\par \cf0\b0\f0\fs20 
\par \cf4\strike\f1\fs24 CNC\cf2\strike0\{linkID=700\}
\par \cf4\strike 
\par Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
750
Scribble750
Receive Program from CNC




Writing



FALSE
29
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fswiss\fprq2\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Receive Program from CNC\cf0\b0\f1\fs20 
\par \cf2\fs24 
\par \{bmc CNC.PNG\}
\par 
\par \pard\nowidctlpar\cf0\f2 Selecting Receive opens a file dialog where you select the name of the file to be received from your CNC Machine Tool.
\par 
\par \f0 Once the file to be received is selected, \f2 CodeShark  presents a dialog which allows for communication settings to be changed. 
\par Selecting Receive File performs the file transfers in background, allow you to use CodeShark to perform other tasks.
\par \pard\f0  
\par \cf2\f1\{bmc Receive.PNG\}\f0 
\par 
\par \cf3 During the receive operation a window is displayed showing the status of the current transfer.
\par \cf2\f1 
\par \{bmc ReceiveFile.PNG\}
\par 
\par \cf3\f0 The Receiving Timeout counter displays a count down in seconds at which time the port will be closed and transmission considered complete.
\par The timeout is set to the value specified in \cf4\strike Protocol Options\cf2\strike0\{linkID=720\}\cf3 , ASCII EOF Timeout.
\par \cf2\f1 
\par \f0\{bmc EOFTimer.PNG\}
\par 
\par \cf3 If Open On Receive is checked, once the file transfer is complete, CodeShark will open the received file in the editor window.\cf2\f1 
\par \cf0\fs20 
\par 
\par \cf4\strike\f0\fs24 CNC\cf2\strike0\{linkID=700\}
\par \cf4\strike 
\par Home\cf2\strike0\{linkID=100\}\cf0\f1\fs20 
\par }
800
Scribble800
Tools




Writing



FALSE
14
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}{\f2\fswiss\fcharset0 Arial;}{\f3\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Tools
\par \cf2\b0\f1\fs24 
\par \pard\sb100\sa100 CodeSharkFCs \cf0\f2 provides the following tools to support the CNC programmer.\f3 
\par \pard\cf1\b\f0\fs32 
\par \cf3\{bmc Tools.PNG\}
\par \cf2\fs24 
\par \cf4\b0\strike Sequence (Re) Number\cf3\strike0\{linkID=810\}\cf2\strike 
\par \cf4 Remove Spaces\cf3\strike0\{linkID=820\}
\par \cf4\strike Tool Renumber\cf3\strike0\{linkID=830\}\cf0\fs20 
\par 
\par \cf4\strike\f1\fs24 Home\cf3\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
810
Scribble810
Sequence (Re) Number




Writing



FALSE
10
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fswiss\fcharset0 Arial;}{\f3\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Sequence (Re)Number\cf0\b0\f1\fs20 
\par 
\par \pard\sb100\sa100\f2\fs24 Selecting Sequence Numbers opens a Dialog which allows you to add or remove line numbers from your program.
\par \f3 
\par \cf2\f2\{bmc SeqNumbers.PNG\}
\par \cf3\strike Tools\cf2\strike0\{linkID=800\}
\par \cf3\strike\f0 Home\cf2\strike0\{linkID=100\}\cf0\f1\fs20 
\par }
820
Scribble820
Remove Spaces




Writing



FALSE
12
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\froman\fcharset0 Times New Roman;}{\f3\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Remove Spaces\cf0\b0\fs20 
\par 
\par \pard\sb100\sa100\f1\fs24 Selecting Remove Spaces removes all spaces (ASCII code 20) from the entire file.
\par 
\par \cf2\{bmc RemoveSpaces.png\}\cf0\f2 
\par \pard\f0\fs20 
\par \cf3\strike\fs24 Tools\cf2\strike0\{linkID=800\}\cf0\fs20 
\par 
\par \cf3\strike\f3\fs24 Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
830
Scribble830
Tool Renumber




Writing



FALSE
12
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\froman\fcharset0 Times New Roman;}{\f3\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Tool Renumber
\par \cf0\b0\fs24 
\par \pard\sb100\sa100\f1 Selecting Tool Renumber opens a Dialog which allows you to add, subtract, or multiply a value to all of the T and optionally H, and D codes in your program.
\par 
\par \cf2\{bmc ToolReNumber.PNG\}\cf0\f2 
\par \pard\f0\fs20 
\par \cf3\strike\fs24 Tools\cf2\strike0\{linkID=800\}\cf0\fs20 
\par 
\par \cf3\strike\f3\fs24 Home\cf2\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
900
Scribble900
G Code Templates




Writing



FALSE
15
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 G Code Templates
\par 
\par \cf2\b0\f1\fs24 G Code Templates provide a user defined static code block insert mechanism and a dynamic (via user created Qt dialogs) insert mechanism.
\par This user interface uses the Turbopower Orpheus component TO32LookOutBar.  This user interface while outdated in appearence, provides
\par for a mechanism that is modifiable on the fly.\cf0\f0\fs20 
\par 
\par \cf3\fs24\{bmc GCodeTemplate.PNG\}
\par 
\par \cf4\strike Static G Code \cf3\strike0\{linkID=910\}
\par \cf4\strike Dynamic G Code\cf3\strike0\{linkID=920\}
\par 
\par \cf4\strike\f1 Home\cf3\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
910
Scribble910
Static G Code 




Writing



FALSE
50
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Static G Code 
\par 
\par \cf2\b0\f1\fs24 With static G Code insertion, clicking on the appropriate icon results in a static block of code being inserted into the editor after the current cursor line position.
\par \cf0\f0\fs20 
\par \cf3\fs24\{bmc GCodeTemplateClick.PNG\}
\par 
\par \cf2\f1 The CSFCgTemplates.XML node <Item> that defines this static code:
\par 
\par <Folder>
\par     <folder_name>Mill 2</folder_name> 
\par     <Items>
\par           .
\par           .
\par \cf0\fs20           .\cf2\fs24 
\par 
\par         <Item> 
\par             <item_name>Start</item_name>
\par             <item_type>static</item_type>
\par             <item_text>G00 G40 G49 G20 G90 </item_text>
\par             <item_imageidx>1</item_imageidx>
\par         </Item>\cf0\f0\fs20 
\par \cf2\f1\fs24           .
\par           .
\par \cf0\fs20           .\f0 
\par 
\par \f1\fs24 Note the XML element \cf2 :
\par 
\par \b <item_name>Start</item_name>\b0 
\par This defines the icon name displayed in the user interface.
\par 
\par \b <item_type>static</item_type>\b0 
\par This defines this element as a static text to insert.
\par 
\par \b <item_text>G00 G40 G49 G20 G90 </item_text>\b0  .
\par This element defines the static text that will be inserted into the editor.
\par To add multiple lines insert "\\n" were you desire new lines.
\par Example:
\par <item_text>G0 G80 G90 Z4. M9\\nG91 G28 Z0\\nG91 G28 X0\\nG91 G30 Y0 B0\\nG90\\nM1\\nM6\\nM30\\n%</item_text>
\par \cf0\f0\fs20 
\par \cf2\b\f1\fs24 <item_imageidx>1</item_imageidx>\b0 
\par This element defines the image displayed in the user interface.  It is an index into a delphi imagelist.\cf0\f0\fs20 
\par 
\par \cf2\f1\fs24 See  \cf4\strike CSFCgTemplates.XML File\cf3\strike0\{linkID=930\} \cf2  for more information.
\par 
\par \cf4\strike G Code Templates\cf3\strike0\{linkID=900\}\cf2\f0 
\par \cf0\fs20 
\par \cf4\strike\f1\fs24 Home\cf3\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
920
Scribble920
Dynamic G Code




Writing



FALSE
53
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Dynamic G Code\cf0\b0\fs20 
\par 
\par \cf2\f1\fs24 With dynamic G Code insertion, clicking on the appropriate icon results in a dialog being displayed.  Once the dialog is successfully executed, the block of code is  inserted after the current cursor line position.
\par 
\par \cf3\f0\{bmc PyScript1.PNG\}
\par \cf0 
\par \cf3\{bmc PyScript2.PNG\}
\par \cf0 
\par \cf3\{bmc PyScript\f1 3\f0 .PNG\}\fs20 
\par 
\par \cf2\f1\fs24 The CSFCgTemplates.XML node <Item> that defines this dynamic dialog:\cf3\f0\fs20 
\par 
\par \cf2\f1\fs24 <Folder>
\par     <folder_name>Mill 2</folder_name> 
\par     <Items>
\par           .
\par           .
\par \cf0\fs20           .\cf2\fs24 
\par 
\par         <Item> 
\par             <item_name>mywidget</item_name>
\par             <item_type>pyscript</item_type>
\par             <item_text>import mywidget; myDialog = mywidget.createMove()</item_text>
\par             <item_imageidx>25</item_imageidx>
\par         </Item>\cf0\f0\fs20 
\par \cf2\f1\fs24           .
\par           .
\par \cf0\fs20           .\cf3\f0 
\par \cf0 
\par \cf2\b\f1\fs24 <item_name>mywidget</item_name>\b0 
\par This defines the icon name displayed in the user interface.
\par 
\par \b <item_type\b0 >\b pyscript</item_type>\b0 
\par This defines this element as a dynamic dialog.
\par 
\par \b <item_text>import mywidget; myDialog = mywidget.createMove()</item_text>\b0 
\par This is the script that is passed to the python interpreter, it imports module mywidget (file mywidget.py) and then creates the dialog ( myDialog = mywidget.createMove()).
\par \b\fs28 CodeSharkFCs expects to find the python script file in the same directory as the CodeSharkFCs executable file.\b0\fs24 
\par See \cf4\strike\f0 Dynamic G Code Dialog Creation\cf3\strike0\{linkID=1000\}\f1\fs20  \cf2\fs24 for more information.\cf0\f0\fs20 
\par 
\par \cf2\b\f1\fs24 <item_imageidx>25</item_imageidx>\b0 
\par This element defines the image displayed in the user interface.  It is an index into a delphi imagelist.\cf0\f0\fs20 
\par 
\par 
\par 
\par \cf2\f1\fs24 See  \cf4\strike CSFCgTemplates.XML File\cf3\strike0\{linkID=930\} \cf2  for more information.
\par 
\par \cf4\strike G Code Templates\cf3\strike0\{linkID=900\}\cf2\f0 
\par \cf0\fs20 
\par \cf4\strike\f1\fs24 Home\cf3\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
930
Scribble930
CSFCgTemplates.XML File




Writing



FALSE
77
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 CSFCgTemplates.XML File\cf0\b0\fs20 
\par 
\par \f1\fs24 Below is the complete sample  CSFCgTemplates.XML file that is included with the CodeSharkFCs download:\f0\fs20 
\par 
\par 
\par <?xml version="1.0" encoding="UTF-8"?>
\par <ds>
\par   <Folders>
\par     <Folder>
\par       <folder_name>Mill 1</folder_name> 
\par       <Items>
\par         <Item> 
\par           <item_name>Start</item_name>
\par           <item_type>static</item_type> 
\par           <item_text>G0 G17 G40 G49 G53 G80 G90 Z0</item_text>
\par           <item_imageidx>1</item_imageidx>
\par         </Item>
\par         <Item> 
\par           <item_name>Stop</item_name> 
\par           <item_type>static</item_type>
\par           <item_text>M0</item_text>
\par           <item_imageidx>3</item_imageidx>
\par         </Item>
\par         <Item> 
\par           <item_name>End</item_name>
\par           <item_type>static</item_type>
\par           <item_text>G0 G80 G90 Z4. M9\\nG91 G28 Z0\\nG91 G28 X0\\nG91 G30 Y0 B0\\nG90\\nM1\\nM6\\nM30\\n%</item_text>
\par           <item_imageidx>18</item_imageidx>
\par         </Item>
\par         <Item> 
\par           <item_name>mywidget</item_name>
\par           <item_type>pyscript</item_type>
\par           <item_text>import mywidget; myDialog = mywidget.createMove()</item_text>
\par           <item_imageidx>25</item_imageidx>
\par         </Item>
\par       </Items>
\par     </Folder>
\par     <Folder>
\par       <folder_name>Mill 2</folder_name> 
\par       <Items>
\par         <Item> 
\par           <item_name>Start</item_name>
\par           <item_type>static</item_type>
\par           <item_text>G00 G40 G49 G20 G90 </item_text>
\par           <item_imageidx>1</item_imageidx>
\par         </Item>
\par         <Item> 
\par           <item_name>Stop</item_name>
\par           <item_type>static</item_type>
\par           <item_text>M0</item_text>
\par           <item_imageidx>3</item_imageidx>
\par         </Item>
\par       </Items>
\par     </Folder>
\par   </Folders>
\par </ds>
\par 
\par \f1\fs24 This file is parsed at CodeSharkFCs start up and populates the user interface.
\par The Item elements are explained in \cf2\strike Static G Code \cf3\strike0\{linkID=910\}\cf0  and \cf2\strike Dynamic G Code\cf3\strike0\{linkID=920\}\cf0 .
\par 
\par The <Folder> element defines a new user interface "folder".
\par The \f0 <folder_name>\f1  element defines the name of the new user interface folder.
\par 
\par 
\par 
\par Currently CodeSharkFCs supports 20 "folders" and 20 items within each folder.
\par 
\par \cf3\{bmc CSFCgTemplateXLS.png\}
\par 
\par \cf4\b\fs28 CodeSharkFCs expects to find the CSFCgTemplates.xml file in the same directory as the CodeSharkFCs executable file.\b0\fs24 
\par \cf0 
\par \cf2\strike G Code Templates\cf3\strike0\{linkID=900\}\cf0 
\par \f0\fs20 
\par \cf2\strike\f1\fs24 Home\cf3\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
940
Scribble940
ImageList




Writing



FALSE
14
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red128\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 ImageList
\par 
\par \cf2\b0\f1\fs24 The <item_imageidx> element defines an index into a delphi imagelist. The imagelist currenlty built with CodeSharkFCs includes
\par the following images for use:
\par 
\par \cf3\{bmc Imagelist1.PNG\}\cf2 
\par \cf3\{bmc Imagelist2.PNG\}\cf0\f0\fs20 
\par 
\par \cf4\strike\fs24 G Code Templates\cf3\strike0\{linkID=900\}\cf0\fs20 
\par 
\par \cf4\strike\f1\fs24 Home\cf3\strike0\f0\{linkID=100\}\cf0\fs20 
\par }
1000
Scribble1000
Dynamic G Code Dialog Creation




Writing



FALSE
82
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Dynamic G Code Dialog Creation
\par 
\par \cf0\b0\f1\fs24 Below is the complete sample python script  mywidget.py  file that is included with the CodeSharkFCs download:
\par This dialog allows for user entry of an X and Y coordinate position. When the user clicks on create, the g code move is written to the editor.
\par This dialog is based on the sample found here: \f0 https://wiki.freecadweb.org/Dialog_creation
\par 
\par # sample dialog 
\par # see https://wiki.freecadweb.org/Dialog_creation
\par # to use:
\par # import mywidget
\par # myDialog = mywidget.createMove()
\par 
\par from PySide import QtCore, QtGui
\par import FreeCAD
\par import CaptureFC 
\par 
\par class Ui_Dialog(object):
\par    def setupUi(self, Dialog):
\par        Dialog.setObjectName("Dialog")
\par        Dialog.resize(187, 178)
\par        self.title = QtGui.QLabel(Dialog)
\par        self.title.setGeometry(QtCore.QRect(10, 10, 271, 16))
\par        self.title.setObjectName("title")
\par        self.label_xlabel = QtGui.QLabel(Dialog)
\par        self.label_xlabel.setGeometry(QtCore.QRect(10, 50, 57, 16))
\par        self.label_xlabel.setObjectName("label_x")
\par        self.label_ylabel = QtGui.QLabel(Dialog)
\par        self.label_ylabel.setGeometry(QtCore.QRect(10, 90, 57, 16))
\par        self.label_ylabel.setObjectName("label_y")
\par        self.xpos = QtGui.QLineEdit(Dialog)
\par        self.xpos.setGeometry(QtCore.QRect(60, 40, 111, 26))
\par        self.xpos.setObjectName("pos_x")
\par        self.ypos = QtGui.QLineEdit(Dialog)
\par        self.ypos.setGeometry(QtCore.QRect(60, 80, 111, 26))
\par        self.ypos.setObjectName("Pos_y")
\par        self.create = QtGui.QPushButton(Dialog)
\par        self.create.setGeometry(QtCore.QRect(50, 140, 83, 26))
\par        self.create.setObjectName("create")
\par 
\par        self.retranslateUi(Dialog)
\par        QtCore.QObject.connect(self.create,QtCore.SIGNAL("pressed()"),self.createMove)
\par        QtCore.QMetaObject.connectSlotsByName(Dialog)
\par 
\par    def retranslateUi(self, Dialog):
\par        Dialog.setWindowTitle("Dialog")
\par        self.title.setText("GCode Move")
\par        self.label_xlabel.setText("X Position")
\par        self.label_ylabel.setText("Y Position")
\par        self.create.setText("Create!")
\par 
\par    def createMove(self):
\par        try:
\par            # first we check if valid numbers have been entered
\par            x = float(self.xpos.text())
\par            y = float(self.ypos.text())
\par        except ValueError:
\par            print("Error! X  and Y values must be valid numbers!")
\par        else:
\par            # Send entry to editor 
\par            gcodeln = 'G1 X' +  self.xpos.text() + ' Y' + self.ypos.text()       
\par            CaptureFC.WrtArgs('user1',gcodeln,'','','','','','','','','')
\par 
\par 
\par class createMove():
\par   def __init__(self):
\par       self.d = QtGui.QWidget()
\par       self.ui = Ui_Dialog()
\par       self.ui.setupUi(self.d)
\par       self.d.show()
\par 
\par \f1 Note the lines:
\par \f0 import CaptureFC 
\par CaptureFC.WrtArgs('user1',gcodeln,'','','','','','','','','')
\par 
\par \f1 CaptureFC is the python module built from source found in CodeSharkFCs unit scrMain.pas.  Using python4delphi's  TPythonModule this module is created and made available for import into the python interpereter. Module CaptureFC contains function WrtArgs, which "writes to the CodeSharkFCs editor".\f0 
\par 
\par \cf2\strike G Code Templates\cf3\strike0\{linkID=900\}\cf0 
\par 
\par \cf2\strike\f1 Home\cf3\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
9000
Scribble9000
Trouble Shooting




Writing



FALSE
21
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 Trouble Shooting
\par 
\par \cf0\b0\fs20 This program is designed with the assumption that you are working with 2D drawings.
\par 
\par The Draft workbench Shape 2D View tool can be handy in creating 2D outlines of an object.
\par 
\par FreeCAD objects may need to be downgraded to their "sub components" via the Draft Downgrade command.
\par 
\par Error - could not load a Python engine
\par FreeCAD does not ?always? load all the required Python files for python4delphi to interface properly.  
\par Installing python from python.org (currently version Python 3.6.6). Fixes this issue.
\par 
\par Error - This application failed to start because it could not find or load the Qt platform plugin "windows" 
\par Problem with QT5 looking for ..\\platforms\\ in the directory of the executable (in this case CodeSharkFC.exe).  
\par You should be able to set environment variables to point to ..\\FreeCAD19\\bin\\platforms but I have not had any luck with this.
\par Work around is to copy contents of ..\\FreeCAD19\\bin\\platforms to ..\\CodeSharkFC\\platforms
\par 
\par \cf2\strike\f1\fs24 Home\cf3\strike0\{linkID=100\}\cf0\f0\fs20 
\par }
9005
Scribble9005
AysncPro Documentation 




Writing



FALSE
15
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 AysncPro Documentation \cf0\b0\f1\fs20 
\par 
\par \f0\fs24 CodeSharkFCs uses the \f1 TurboPower Async Professional\f0  componet to handle serial port communications.
\par 
\par The Reference Guide and Developers Guide for this component can be found at:\f1 
\par \f0 
\par \b\fs28 Reference Guide:  \b0\f1\fs24 http://tpapro.sourceforge.net/docs/APRO_ReferenceGuide.pdf
\par 
\par \b\f0\fs28 Developers Guide: \b0\f1\fs24 http://tpapro.sourceforge.net/docs/APRO_DevGuide.pdf
\par 
\par 
\par \cf2\strike\f0 Home\cf3\strike0\{linkID=100\}\cf0\f1\fs20 
\par }
9010
Scribble9010
Serial Communications




Writing



FALSE
45
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Serial Communications  
\par 
\par \cf0\b0\fs24 CodeSharkFCs uses the \f1 TurboPower Async Professional\f0  componet to handle serial port communications.
\par 
\par The Reference Guide and Developers Guide for this component can be found at:\f1 
\par \f0 
\par \cf2\b\strike\fs28 AysncPro Documentation \cf3\strike0\{linkID=9005\}\cf0\b0\f1\fs24 
\par 
\par \f0 
\par There have been instances of CodeSharkFCs not sending out the last block of data to the receiving device. The problem appears to be
\par that AsyncPro informs the controlling program (CodeSharkFCs) that file transmission is complete before that actual final characters are
\par  transmitted out the device's or Window's i/o buffer.  This results in CodeSharkFCs closing the serial port prior to the complete transmission 
\par of data. Once the serial port is closed, serial transmission stops. The Close Port Timeout setting has been added as a work around for this issue. 
\par \b When using CodeSharkFCs for DNC, the user may need to adjust the timeout depending on the lenght of time need for the machine tool to complete 
\par the final machining blocks.
\par \b0 
\par This issue may be a result of the changes made to the AsyncPro dispatcher at  release 4.07, but still unknown.
\par 
\par From the \f1 TurboPower Async Professional\f0  readme.txt file:
\par \f1 
\par \fs20 4.2 Release 4.07
\par 
\par Enhancements
\par ------------
\par 
\par The serial port dispatcher was completely rewritten to make it less
\par vulnerable to poorly behaved (blocking) event handlers.  The new
\par dispatcher will continue to buffer serial port input until it runs
\par out of memory for buffers if any of the user's event handlers block.
\par The output thread of the dispatcher is now double buffered to allow
\par output to be written to the serial port while the user's thread
\par continues to work.  This improves throughput for some file transfer
\par protocols like zmodem.
\par 
\par If you encounter problems when using the new serial port dispatcher,
\par define the conditional \ul\b UseAwWin32\ulnone\b0  and rebuild your project and / or
\par packages.  This will disable the new dispatcher and use the 4.06
\par dispatcher in its place.  If your problem goes away after doing this
\par then you have probably discovered a bug in the new dispatcher and you
\par should report it via the support news groups.
\par \fs24 
\par \cf2\strike\f0 Home\cf3\strike0\{linkID=100\}\cf0\f1 
\par }
0
0
0
13
1 CodeSharkFCs=Scribble99
1 Home=Scribble100
1 FreeCad Setup=Scribble200
1 Start FreeCad=Scribble300
1 Pick Geometry=Scribble400
1 Generate Path PathKurveUtils=Scribble500
1 Path FromShapes=Scribble510
1 Settings=Scribble600
1 CNC=Scribble700
1 Tools=Scribble800
1 G Code Templates=Scribble900
1 Trouble Shooting=Scribble9000
1 Serial Communications=Scribble9010
6
*InternetLink
16711680
Courier New
0
10
1
....
0
0
0
0
0
0
*ParagraphTitle
-16777208
Arial
0
11
1
B...
0
0
0
0
0
0
*PopupLink
-16777208
Arial
0
8
1
....
0
0
0
0
0
0
*PopupTopicTitle
16711680
Arial
0
10
1
B...
0
0
0
0
0
0
*TopicText
-16777208
Arial
0
10
1
....
0
0
0
0
0
0
*TopicTitle
16711680
Arial
0
16
1
B...
0
0
0
0
0
0
