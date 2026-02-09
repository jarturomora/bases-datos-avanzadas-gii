FROM python:3.11-slim

# System deps (optional but helpful)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Create a non-root user (good practice)
RUN useradd -ms /bin/bash jovyan
USER jovyan

WORKDIR /home/jovyan/work

# Copy notebooks into the image (can be overridden by bind mount in compose)
COPY --chown=jovyan:jovyan notebooks /home/jovyan/work/notebooks

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--ServerApp.token=", "--ServerApp.password=", "--ServerApp.allow_origin=*", "--ServerApp.allow_remote_access=True"]
