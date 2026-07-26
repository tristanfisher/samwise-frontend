import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    cors: {
      // browser origin
      origin: 'http://localhost:5173'
    },
    // used to resolve assets
    // todo: need to serve index from go backend so all API requests are to the same domain. this is supposed to be
    // handled by https://vite.dev/guide/backend-integration.html
    // does 'origin' not work here?
    // origin: 'http://localhost:5173',
    // in dev, the suggestion is to update the index file used
  }
})
