import { defineConfig } from 'vite-plus'

export default defineConfig({
  run: {
    tasks: {
      dev: {
        command: 'slidev --open',
        cache: false,
      },
      build: {
        command: 'slidev build --base /00000000_theme/ --out ../../dist/00000000_theme',
        cache: false,
      },
      export: {
        command: 'slidev export --output ../../exports/00000000_theme.pdf',
        cache: false,
      },
    },
  },
})
