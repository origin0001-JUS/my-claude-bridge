FROM node:20
RUN apt-get update && apt-get install -y git python3 make g++
RUN npm install -g @anthropic-ai/claude-code cokacdir
WORKDIR /app
# 서버를 죽지 않게 강제로 살려두는 명령어입니다.
CMD ["tail", "-f", "/dev/null"]
