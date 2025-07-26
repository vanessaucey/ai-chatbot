# 1. Use the Node.js 18 Alpine image (lightweight Linux base)
FROM node:18-alpine

# 2. Install pnpm globally (like installing it on your laptop)
RUN npm install -g pnpm

# 3. Set the working directory inside the container to /app
WORKDIR /app

# 4. Copy package.json and pnpm-lock.yaml to the container (only dependency files for now)
COPY package.json pnpm-lock.yaml* ./

# 5. Install project dependencies using pnpm
RUN pnpm install

# 6. Copy the rest of the project files (source code, config, etc.)
COPY . .

# 7. Build the app (typically for a frontend framework like Next.js or Vite)
RUN pnpm build

# 8. Expose port 3000 so it can be accessed from outside the container
EXPOSE 3000

# 9. Run the app — this starts the production server (e.g., Next.js)
CMD ["pnpm", "start"]
