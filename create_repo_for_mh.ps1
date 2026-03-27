#Set-ExecutionPolicy -Scope CurrentUser Unrestricted

#RootPath
$rootPath = "C:\_data\_git\LBR_new_repo_MH\"
#Repo source
$repoNameSrc = "posalux-mh.0783"

#Set up path
$clonePath = "https://github.com/posaluxch/" + $repoNameSrc + ".git"
Set-Location $rootPath
git init

#Clone source path
git clone $clonePath
Move-Item -Path $rootPath$repoNameSrc"\source" -Destination $rootPath"\source"

#Remove old git 
Remove-Item -Path $rootPath$repoNameSrc -Recurse -Force

#Remove old git submodule
Remove-Item -Path $rootPath"\source\EdmCore" -Recurse -Force
Remove-Item -Path $rootPath"\source\PxSpace" -Recurse -Force
Remove-Item -Path $rootPath"\source\PxSarix" -Recurse -Force

#Add git submodule
git submodule init
git submodule add "https://github.com/posaluxch/posalux-edm-plc.git" "source/EdmCore"
git submodule add "https://github.com/posaluxch/posalux-edm-pxsarix.git" "source/PxSpace"
git submodule add "https://github.com/posaluxch/posalux-pxspace-plc.git" "source/PxSarix"

git submodule update

Set-ExecutionPolicy -Scope CurrentUser Restricted