import { defineConfig } from 'vite-plus'

export default defineConfig({
  run: {
    tasks: {
      dev: {
        command: 'slidev --open',
        cache: false,
      },
      build: {
        command: 'slidev build --base ./ --router-mode hash --out ../../dist/00000000_example',
        cache: false,
      },
      export: {
        command: 'slidev export --output ../../exports/00000000_example.pdf',
        cache: false,
      },
    },
  },
})
