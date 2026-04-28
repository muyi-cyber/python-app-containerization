FROM python:3.11-alpine

#Add the dependencies needed to build psycopg2 
RUN apk add --no-cache postgresql-dev gcc python3-dev musl-dev libffi-dev build-base

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python","main.py"]

