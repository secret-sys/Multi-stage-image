# ===== Stage 1: Build =====
FROM node:20 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

# ===== Stage 2: Runtime =====
FROM node:20-slim

RUN useradd -m appuser
USER appuser

WORKDIR /app
COPY --from=builder /app .

EXPOSE 3000
CMD ["node", "index.js"]