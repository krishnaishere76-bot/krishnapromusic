FROM python:3.10-slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN nslookup -type=SRV _mongodb._tcp.cluster0.0ob4dvz.mongodb.net
RUN pip install dnspython
COPY . .
EXPOSE 8080
CMD ["python", "main.py"]
