#! /usr/bin/python3
import os
import re

if __name__ == "__main__":

    rootdir = "./data"
    regex = re.compile("(.*txt$)")

    text_file_list = []

    for root, dirs, files in os.walk(rootdir):
        for file in files:
            if regex.match(file):
                text_file_list.append(root + "/" + file)

    # Open and modify file
    for text_file in text_file_list:
        csv_file = text_file[0:-4] + ".csv"

        with open(text_file, 'r') as file:
            data = file.read()
            data = data.replace(",", ".")
            data = data.replace("\t", ",")

        with open(csv_file, 'w') as file:
            file.write(data)
