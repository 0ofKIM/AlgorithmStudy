import tkinter
import tkinter.filedialog
import os
import re
import shutil
import subprocess

# input author name
authorName = input("작성자 이름: ").replace(" ", "")
# input problem name
problemName = input("문제 이름: ").replace(" ", "")
# input file path to submit
print("제출할 파일을 선택해주세요.")
tkinter.Tk().withdraw()
absoluteFilePath = tkinter.filedialog.askopenfilename(title="제출할 파일을 선택해주세요.")
print("파일 경로: ", absoluteFilePath)
# input commit message
commitMessage = input("커밋메시지: ")

# get most recent directory
baseDirectory = "./dirs"
previousDirectories = os.listdir(baseDirectory)

directorySuffix = "주차"
directoryPatternString = "([\d]+)"+directorySuffix
directoryPattern = re.compile(directoryPatternString)

maxWeek = 1
for directory in previousDirectories:
  week = int(directoryPattern.match(directory).group(1))
  if week > maxWeek:
    maxWeek = week

# get new directory name
newWeekString = "%s%s" % (maxWeek + 1, directorySuffix)
newDirectoryName = "%s/%s" % (baseDirectory, newWeekString)

# get new branch name
newBranchName = "feature/%s(%s)-%s" % (authorName, newWeekString, problemName)

# get new file path
originalFileName = os.path.basename(absoluteFilePath)
newAbsoluteFilePath = "%s/%s" % (newDirectoryName, originalFileName)

# check confirm
print()
print("아래 내용으로 제출하시겠습니까?")
print("* 제출할 파일:", newAbsoluteFilePath)
print("* branch:", newBranchName)
print("* commit message", commitMessage)
confirm = input("(y/n) :")
if confirm != 'y':
  print("취소되었습니다.")
  exit()

# start execute
# create new directory
os.mkdir(newDirectoryName)
print("create new directory [ %s ]" % (newDirectoryName))

# create new git branch
GIT_CHECKOUT_MASTER_CMD = "git checkout master"
subprocess.call(GIT_CHECKOUT_MASTER_CMD.split(" "))

GIT_PULL_MASTER_CMD = "git pull origin master"
subprocess.call(GIT_PULL_MASTER_CMD.split(" "))

GIT_CHECKOUT_CMD = "git checkout -b %s" % (newBranchName)
subprocess.call(GIT_CHECKOUT_CMD.split(" "))

# copy file to new directory
shutil.copy(absoluteFilePath, newAbsoluteFilePath)
print("move file [ %s ] to [ %s ]" % (absoluteFilePath, newAbsoluteFilePath))

# git add
GIT_ADD_CMD = "git add %s" % (newAbsoluteFilePath)
subprocess.call(GIT_ADD_CMD.split(" "))

# git commit
GIT_COMMIT_CMD = "git commit -m"
commitMessage = "'%s'" % (commitMessage)

GIT_COMMIT_CMD = GIT_COMMIT_CMD.split(" ")
GIT_COMMIT_CMD.append(commitMessage)

subprocess.call(GIT_COMMIT_CMD)

# git push
GIT_PUSH_CMD = "git push origin %s" % (newBranchName)
subprocess.call(GIT_PUSH_CMD.split(" "))

# git delete local branch
GIT_CHECKOUT_MASTER_CMD = "git checkout master"
subprocess.call(GIT_CHECKOUT_MASTER_CMD.split(" "))

GIT_DELETE_LOCAL_BRANCH_CMD = "git branch -d %s" % (newBranchName)
subprocess.call(GIT_DELETE_LOCAL_BRANCH_CMD.split(" "))