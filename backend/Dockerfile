FROM python3.8

WORKDIR /code

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app/ .

COPY credentials.json .
ENV GOOGLE_APPLICATION_CREDENTIALS=$WORKDIR/credentials.json

RUN mkdir /data
EXPOSE 80

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]