import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  base: process.env.NODE_ENV === 'production' ? '/projetoPW/' : '/',
  plugins: [vue()],
  server: {
    port: 5173,
    host: true // permite acesso pela rede local
  }
})