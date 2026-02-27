FROM node:20

# 1. 필수 도구 설치 (가상 터미널 생성을 위한 bsdutils)
RUN apt-get update && apt-get install -y git python3 make g++ bsdutils

# 2. 프로그램 설치 (철자 cokacdir 확인)
RUN npm install -g @anthropic-ai/claude-code cokacdir

WORKDIR /app

# 3. 환경 변수 강제 고정 (화면 에러 방지)
ENV CI=true
ENV TERM=xterm
ENV COLUMNS=100
ENV LINES=30

# 4. 실행 명령어 (script 명령어로 가상 터미널을 만들어 에러를 방지하고 출력을 실시간으로 보여줍니다)
CMD ["script", "-qec", "cokacdir start", "/dev/null"]
