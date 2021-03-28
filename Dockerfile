FROM python:3.9-slim-buster

## Step 1:
WORKDIR /app

## Step 2:
COPY requirements.txt .
COPY app/src/run.py .
COPY app/src/app ./app


## Step 3:
# Install packages from requirements.txt
RUN pip install -r requirements.txt

## Step 4:
# Expose port 5000
EXPOSE 5000

## Step 5:
# Run app.py at container launch
CMD ["gunicorn", "-b", "0.0.0.0:5000", "run:app"]
