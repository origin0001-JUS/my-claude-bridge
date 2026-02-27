FROM node:20-slim

# 1. 필수 라이브러리 설치
RUN apt-get update && apt-get install -y git python3 make g++ bsdutils

# 2. 프로그램 설치 (하이픈 없이 cokacdir)
RUN npm install -g @anthropic-ai/claude-code cokacdir

# 3. 작업 디렉토리 설정
WORKDIR /app

# 4. 환경 변수 설정
ENV CI=true
ENV TERM=xterm

# 5. 실행 명령어 (절대 'k'를 쓰지 마세요!)
CMD ["cokacdir", "start"]
