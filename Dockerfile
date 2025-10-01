FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc libpq-dev python3-dev wget curl \
    bzip2 ca-certificates rsync \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY gutendex/requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && chmod +x entrypoint.sh

COPY gutendex/ .

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE 9193
ENTRYPOINT ["/entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:9193"]