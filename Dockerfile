FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
# Dit is de 'NetworkChuck bridge' die van een lokale tool een n8n-server maakt:
CMD ["npx", "-y", "@modelcontextprotocol/inspector", "build/main/main/cli.js"]
