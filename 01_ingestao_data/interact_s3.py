
import boto3

import pathlib
import os

#print(str(os.path.dirname(os.path.abspath(__file__))).split('\\')[:-1])
main_path = "\\".join(str(os.path.dirname(os.path.abspath(__file__))).split('\\')[:-1]) + "\\"

#print(main_path)
file_path = "00_raw_data\\"
list_file = list(pathlib.Path(main_path+file_path).glob("**/*csv"))

for file in list_file:
    #print(str(file).split("\\"))
    file = str(file).split("\\")[-1]
    upload_path = main_path + file_path + file
    print(upload_path)
    s3_client = boto3.client('s3')
    s3_client.upload_file(upload_path,'datalake-lucas-igti-01','raw-data/desafio-modulo-01/'+file)
    print("ingestao concluida")

"""
#Fazer ingestão de Dados no S3

#s3_client = boto3.client('s3')
#s3_client.upload_file('data/MICRODADOS_ENEM_2019.csv','datalake-lucas-516190547158','raw-data/MICRODADOS_ENEM_2019.csv')

"""
