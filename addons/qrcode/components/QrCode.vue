<script setup lang="ts">
import type { QrCodeGenerateSvgOptions } from 'uqr'
import { renderSVG } from 'uqr'
import { computed } from 'vue'

const props = defineProps<{
  url: string
  options?: QrCodeGenerateSvgOptions
}>()

const svg = computed(() =>
  renderSVG(props.url, {
    blackColor: 'currentColor',
    whiteColor: 'transparent',
    ...props.options,
  }),
)
</script>

<template>
  <div class="qr-code" v-html="svg"></div>
</template>

<style scoped>
.qr-code :deep(svg) {
  display: block;
  width: 100%;
  height: auto;
}
</style>
