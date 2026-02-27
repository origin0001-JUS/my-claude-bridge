FROM node:20-slim

# 1. 필수 도구 설치
RUN apt-get update && apt-get install -y git python3 make g++

# 2. 클로드 코드 및 코각DIR 설치
RUN npm install -g @anthropic-ai/claude-code cokacdir

WORKDIR /app

# 3. 환경 변수 설정 (TUI 화면을 끄고 백그라운드 모드로 실행 유도)
ENV CI=true

# 4. 실행 명령어 (절대 k를 쓰지 마시고, node 단어도 빼주세요)
CMD ["cokacdir", "start"]
