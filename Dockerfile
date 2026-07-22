FROM python:3.12-slim

WORKDIR /app

# Instalar git y node (necesario para supergateway)
RUN apt-get update && apt-get install -y git curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Clonar e instalar tp-mcp
RUN git clone https://github.com/TU-USUARIO/trainingpeaks-mcp.git . && \
    pip install -e .

EXPOSE 8000

CMD ["npx", "-y", "supergateway", "--stdio", "tp-mcp serve", "--port", "8000"]
