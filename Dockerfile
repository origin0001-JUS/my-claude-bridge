FROM node:20-slim

# 필수 도구 설치
RUN apt-get update && apt-get install -y git python3 make g++

# 클로드 코드 및 코각 DIR 설치
RUN npm install -g @anthropic-ai/claude-code cokac-dir

WORKDIR /app

# 실행 명령어
CMD ["cokak-dir", "start"]
