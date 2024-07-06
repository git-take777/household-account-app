FROM node:18

WORKDIR /app

COPY init-react.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-react.sh

CMD ["/usr/local/bin/init-react.sh"]


# FROM node:14

# WORKDIR /app

# RUN npx create-react-app .

# EXPOSE 3000

# CMD ["npm", "start"]