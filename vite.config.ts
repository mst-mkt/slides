import { defineConfig } from 'vite-plus'

export default defineConfig({
  staged: {
    '*': 'vp check --fix',
  },
  run: {
    tasks: {
      new: {
        command: 'nu scripts/new-slide.nu',
        cache: false,
      },
      dev: {
        command: 'nu scripts/dev.nu',
        cache: false,
      },
      build: {
        command: '',
        dependsOn: ['build:slides', 'build:index'],
      },
      export: {
        command: 'vpr -F "./slides/*" --parallel export',
        cache: false,
      },
      deploy: {
        command: 'wrangler deploy',
        cache: false,
      },
      preview: {
        command: 'wrangler dev',
        cache: false,
      },

      'build:slides': {
        command: 'vpr -F "./slides/*" --concurrency-limit 1 build',
        cache: false,
      },
      'build:index': {
        command: 'nu scripts/build-index.nu',
      },
    },
  },
  fmt: {
    semi: false,
    singleQuote: true,
    sortImports: {},
    sortPackageJson: {
      sortScripts: false,
    },
  },
})
