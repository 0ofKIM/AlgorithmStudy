import tkinter
import tkinter.filedialog
import os
import re
import shutil
import subprocess

BASE_DIRECTORY = "./dirs"
DIRECTORY_SUFFIX = "주차"


def get_next_directory_name(base_directory, directory_suffix):
    directory_pattern_string = "([\d]+)" + directory_suffix
    directory_pattern = re.compile(directory_pattern_string)

    max_week = 1
    previous_directories = os.listdir(base_directory)
    for directory in previous_directories:
        match = directory_pattern.match(directory)
        if match:
            week = int(match.group(1))
            if week > max_week:
                max_week = week

    new_week_string = "%s%s" % (max_week + 1, directory_suffix)
    new_directory_name = "%s/%s" % (base_directory, new_week_string)

    return new_week_string, new_directory_name


def get_submit_file_path(absolute_file_path):
    original_file_name = os.path.basename(absolute_file_path)
    new_absolute_file_path = "%s/%s" % (new_directory_name, original_file_name)

    return new_absolute_file_path


def check_before_execute(new_absolute_file_path, new_branch_name, commit_message):
    print()
    print("아래 내용으로 제출하시겠습니까?")
    print("* 제출할 파일:", new_absolute_file_path)
    print("* branch:", new_branch_name)
    print("* commit message", commit_message)

    _confirm = input("(y/n) :")
    return _confirm

def git_checkout_from_master(new_branch_name):
    git_checkout_master_cmd = "git checkout master"
    subprocess.call(git_checkout_master_cmd.split(" "))

    GIT_PULL_MASTER_CMD = "git pull origin master"
    subprocess.call(GIT_PULL_MASTER_CMD.split(" "))

    GIT_CHECKOUT_CMD = "git checkout -b %s" % (new_branch_name)
    subprocess.call(GIT_CHECKOUT_CMD.split(" "))


def git_add_and_commit(new_absolute_file_path, commit_message):
    git_add_cmd = "git add %s" % new_absolute_file_path
    subprocess.call(git_add_cmd.split(" "))

    git_commit_cmd = "git commit -m"
    commit_message = "'%s'" % commit_message

    git_commit_cmd = git_commit_cmd.split(" ")
    git_commit_cmd.append(commit_message)

    subprocess.call(git_commit_cmd)


def git_push_and_delete_local_branch(new_branch_name):
    git_push_cmd = "git push origin %s" % (new_branch_name)
    subprocess.call(git_push_cmd.split(" "))

    # git delete local branch
    git_checkout_master_cmd = "git checkout master"
    subprocess.call(git_checkout_master_cmd.split(" "))

    git_delete_local_branch_cmd = "git branch -d %s" % (new_branch_name)
    subprocess.call(git_delete_local_branch_cmd.split(" "))


# input
author_name = input("작성자 이름: ").replace(" ", "")
problem_name = input("문제 이름: ").replace(" ", "")
print("제출할 파일을 선택해주세요.")
tkinter.Tk().withdraw()
absoluteFilePath = tkinter.filedialog.askopenfilename(title="제출할 파일을 선택해주세요.")
print("파일 경로: ", absoluteFilePath)
commit_message = input("커밋메시지: ")

newWeekString, new_directory_name = get_next_directory_name(BASE_DIRECTORY, DIRECTORY_SUFFIX)
new_branch_name = "feature/%s(%s)-%s" % (author_name, newWeekString, problem_name)
new_absolute_file_path = get_submit_file_path(absoluteFilePath)

confirm = check_before_execute(new_absolute_file_path, new_branch_name, commit_message)
if confirm != 'y':
    print("취소되었습니다.")
    exit()

print("* [INFO] Create new directory [ %s ]" % (new_directory_name))
os.mkdir(new_directory_name)

print("* [INFO] Create and checkout to branch [ %s ]" % (new_branch_name))
git_checkout_from_master(new_branch_name)

print("* [INFO] Copy file [ %s ] to [ %s ]" % (absoluteFilePath, new_absolute_file_path))
shutil.copy(absoluteFilePath, new_absolute_file_path)

print("* [INFO] Git add and commit")
git_add_and_commit(new_absolute_file_path, commit_message)

print("* [INFO] Git push and delete local branch [ %s ]" % (new_branch_name))
git_push_and_delete_local_branch(new_branch_name)