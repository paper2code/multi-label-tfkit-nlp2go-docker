
from tqdm import tqdm

import json
import os.path
import csv
file_name = "papers-with-abstracts.json"

with open(file_name, encoding='utf-8') as f:
  with open('papers-with-abstracts.csv','w', encoding='utf-8') as fw:
    csv_write = csv.writer(fw)
    docs = json.load(f)
    rows = []
    for doc in tqdm(docs):
      if doc['title'] != '' and len(doc['tasks']) > 0:
        rows.append([doc['title'],"/".join(doc['tasks'])])
    csv_write.writerows(rows)   
