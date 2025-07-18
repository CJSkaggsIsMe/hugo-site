FROM klakegg/hugo:ext-alpine as build
WORKDIR /src	
COPY . .
RUN hugo --minify

FROM nginx:alpine
COPY --from=build /src/public /usr/share/nginx/html

