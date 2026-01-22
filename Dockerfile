# Gebruik Node.js 20 slim als basis
FROM node:20-slim

# Installeer basis afhankelijkheden voor het bouwen
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Kopieer alleen de pakketbestanden eerst
COPY package*.json ./

# Installeer afhankelijkheden en NEGEER de automatische 'prepare' scripts
# Dit voorkomt de fout die je net zag
RUN npm install --ignore-scripts

# Kopieer nu de rest van de bestanden (inclusief tsconfig.json)
COPY . .

# Voer de build nu handmatig uit
RUN npm run build

# Stel poort 3000 open
EXPOSE 3000

# Start de server met de SSE-bridge voor n8n
CMD ["npx", "-y", "@modelcontextprotocol/inspector", "build/main/main/cli.js"]
