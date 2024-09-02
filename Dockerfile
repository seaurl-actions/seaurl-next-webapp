FROM node:18

# 设置工作路径。所有的路径都会关联WORKDIR
WORKDIR /usr/src/app

RUN git clone --depth 1 git@codeup.aliyun.com:seaurl/seaurl/web/seaurl-next-webapp.git

# 安装依赖
RUN npm config set registry https://registry.npmmirror.com
RUN npm install -g pnpm
RUN pnpm config set store-dir=https://pnpmfile.js.org
RUN pnpm config set registry https://registry.npmmirror.com
RUN pnpm install

# 构建应用
RUN pnpm run build

# 运行应用
CMD [ "pnpm", "start" ]