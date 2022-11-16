#! /usr/bin/python3
import os
import re
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog = 'Clean File',description = 'cleans txt to csv files')
    parser.add_argument('path')

    args = parser.parse_args()

    regex = re.compile("(.*txt$)")

    text_file_list = []

    for root, dirs, files in os.walk(args.path):
        for file in files:
            if regex.match(file):
                text_file_list.append((root,file))

    # Open and write new file
    for root, filename in text_file_list:
        csv_file = "./data/" + filename[0:-4] + ".csv"
        text_file = root + "/" + filename

        if not ("_" in filename):
            continue

        with open(text_file, 'r') as file:
            data = file.read()
            data = data.replace(",", ".")
            data = data.replace("\t", ",")

        with open(csv_file, 'w') as file:
            file.write(data)
