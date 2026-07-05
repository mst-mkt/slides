import { defineConfig } from 'vite-plus'

export default defineConfig({
  staged: {
    '*': 'vp check --fix',
  },
  run: {
    tasks: {
      build: {
        command: 'vpr -F "./slides/*" --parallel build',
        cache: false,
      },
      export: {
        command: 'vpr -F "./slides/*" --parallel export',
        cache: false,
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
