import { defineConfig } from 'vite-plus'

export default defineConfig({
  run: {
    tasks: {
      dev: {
        command: 'slidev --open',
        cache: false,
      },
      build: {
        command: 'slidev build --base /{{NAME}}/ --out ../../dist/{{NAME}}',
        cache: false,
      },
      export: {
        command: 'slidev export --output ../../exports/{{NAME}}.pdf',
        cache: false,
      },
    },
  },
})
