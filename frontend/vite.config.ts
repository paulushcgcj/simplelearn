import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'url'
import svgLoader from 'vite-svg-loader'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    svgLoader({
      defaultImport: 'component'
    })],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  server: {
    watch: {
      usePolling: true,
      ignorePermissionErrors: true,
      ignored: [
        '**/node_modules/**',
        '**/.vscode/**',
        '**/dist/**',
        '**/coverage/**',
        '**/build/**',
        '**/out/**',
        '**/reports/**',
        '**/.husky/**'
      ]
    }
  }
})
