FROM node:20-slim

# 1. 필수 도구 설치 (가상 터미널을 위한 bsdutils 추가)
RUN apt-get update && apt-get install -y git python3 make g++ bsdutils

# 2. 프로그램 설치
RUN npm install -g @anthropic-ai/claude-code cokacdir

WORKDIR /app

# 3. 환경 변수 고정 (에러 방지용)
ENV CI=true
ENV TERM=xterm
ENV COLUMNS=100
ENV LINES=30

# 4. 실행 명령어 (가상 터미널을 생성하여 'Raw mode' 에러를 우회합니다)
CMD ["script", "-qec", "cokacdir start", "/dev/null"]
