#use the official python 3.10 image
FROM python:3.9

#set the working directory to/ code 
WORKDIR /code

COPY ./requirements.txt  /code/requirements.txt 

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

RUN useradd user 
USER  user 

ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

WORKDIR $HOME/app 

COPY  --chown=user . $HOME/app


CMD ["uvicorn","app:app","--host","0.0.0.0","--port","7860"]
