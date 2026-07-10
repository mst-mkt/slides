import { defineConfig } from 'vite-plus'

export default defineConfig({
  run: {
    tasks: {
      dev: {
        command: 'slidev --open',
        cache: false,
      },
      build: {
        command:
          'slidev build --base /20260711_kanto-tech-circle-meetup/ --out ../../dist/20260711_kanto-tech-circle-meetup',
        cache: false,
      },
      export: {
        command: 'slidev export --output ../../exports/20260711_kanto-tech-circle-meetup.pdf',
        cache: false,
      },
    },
  },
})
