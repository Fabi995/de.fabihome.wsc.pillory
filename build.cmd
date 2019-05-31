@echo off
chcp 1252

SET finalList=package.xml

goto inputPackagename

:inputPackagename
for %%* in (.) do SET packagename=%%~nx*
goto :checkTemplates

:checkTemplates
IF EXIST "%CD%\templates" goto :compileTemplates
goto :checkAcpTemplates

:compileTemplates
start "" "C:\Program Files\7-Zip\7z" a -ttar templates.tar ./templates/*
SET finalList=%finalList%;templates.tar
timeout /t 1
goto :checkAcpTemplates

:checkAcpTemplates
IF EXIST "%CD%\acptemplates" goto :compileAcpTemplates
goto :checkFiles

:compileAcpTemplates
start "" "C:\Program Files\7-Zip\7z" a -ttar acptemplates.tar ./acptemplates/*
SET finalList=%finalList%;acptemplates.tar
timeout /t 1
goto :checkFiles

:checkFiles
IF EXIST "%CD%\files" goto :compileFiles
goto :checkXMLFiles

:compileFiles
start "" "C:\Program Files\7-Zip\7z" a -ttar files.tar ./files/*
SET finalList=%finalList%;files.tar
timeout /t 1
goto :checkXMLFiles

:checkXMLFiles
IF EXIST "aclOption.xml" SET finalList=%finalList%;aclOption.xml
IF EXIST "acpMenu.xml" SET finalList=%finalList%;acpMenu.xml
IF EXIST "acpSearchProvider.xml" SET finalList=%finalList%;acpSearchProvider.xml
IF EXIST "acpTemplate.xml" SET finalList=%finalList%;acpTemplate.xml
IF EXIST "bbcode.xml" SET finalList=%finalList%;bbcode.xml
IF EXIST "box.xml" SET finalList=%finalList%;box.xml
IF EXIST "clipboardAction.xml" SET finalList=%finalList%;clipboardAction.xml
IF EXIST "coreObject.xml" SET finalList=%finalList%;coreObject.xml
IF EXIST "cronjob.xml" SET finalList=%finalList%;cronjob.xml
IF EXIST "eventListener.xml" SET finalList=%finalList%;eventListener.xml
IF EXIST "file.xml" SET finalList=%finalList%;file.xml
IF EXIST "language.xml" SET finalList=%finalList%;language.xml
IF EXIST "mediaProvider.xml" SET finalList=%finalList%;mediaProvider.xml
IF EXIST "menu.xml" SET finalList=%finalList%;menu.xml
IF EXIST "menuItem.xml" SET finalList=%finalList%;menuItem.xml
IF EXIST "templateListener.xml" SET finalList=%finalList%;templateListener.xml
IF EXIST "objectType.xml" SET finalList=%finalList%;objectType.xml
IF EXIST "objectTypeDefinition.xml" SET finalList=%finalList%;objectTypeDefinition.xml
IF EXIST "option.xml" SET finalList=%finalList%;option.xml
IF EXIST "page.xml" SET finalList=%finalList%;page.xml
IF EXIST "pip.xml" SET finalList=%finalList%;pip.xml
IF EXIST "smiley.xml" SET finalList=%finalList%;smiley.xml
IF EXIST "script.xml" SET finalList=%finalList%;script.xml
IF EXIST "sql.xml" SET finalList=%finalList%;sql.xml
IF EXIST "style.xml" SET finalList=%finalList%;style.xml
IF EXIST "template.xml" SET finalList=%finalList%;template.xml
IF EXIST "userGroupOption.xml" SET finalList=%finalList%;userGroupOption.xml
IF EXIST "userNotificationEvent.xml" SET finalList=%finalList%;userNotificationEvent.xml
IF EXIST "userOption.xml" SET finalList=%finalList%;userOption.xml
IF EXIST "userProfileMenu.xml" SET finalList=%finalList%;userProfileMenu.xml
IF EXIST "install.sql" SET finalList=%finalList%;install.sql
IF EXIST "update_01.sql" SET finalList=%finalList%;update_01.sql
goto :checkLanguage

:checkLanguage
IF EXIST "%CD%\language" SET finalList=%finalList%;language
goto :checkOptionals

:checkOptionals
IF EXIST "%CD%\optionals" SET finalList=%finalList%;optionals
goto :checkRequierments

:checkRequierments
IF EXIST "%CD%\requierments" SET finalList=%finalList%;requierments
goto :compilePackage

:compilePackage
(for %%a in (%finalList%) do (
   echo %%a
   echo/
)) > finalList.txt
start "" "C:\Program Files\7-Zip\7z" a -ttar %packagename%.tar @finalList.txt
timeout /t 1
goto :delFiles

:delFiles
del finalList.txt
IF EXIST "%CD%\files" del files.tar
IF EXIST "%CD%\templates" del templates.tar
IF EXIST "%CD%\acptemplates" del acptemplates.tar
goto :output

:output
exit