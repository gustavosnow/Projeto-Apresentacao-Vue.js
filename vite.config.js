import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  base: '/Projeto-Apresentacao-Vue.js/', // Set to your repository name
  plugins: [vue()],
  server: {
    port: 5173,
    host: true
  }
})