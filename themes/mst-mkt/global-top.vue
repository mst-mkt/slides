<script setup lang="ts">
import { useSlideContext } from '@slidev/client'
import QrCode from 'slidev-addon-qrcode/components/QrCode.vue'
import { computed } from 'vue'

const { $slidev } = useSlideContext()
const url = computed(() => $slidev.configs.seoMeta?.ogUrl)
const visible = computed(
  () => $slidev.nav.currentSlideRoute?.meta?.slide?.frontmatter?.qr !== false,
)
</script>

<template>
  <QrCode
    v-if="url"
    class="absolute bottom-6 right-6 w-12 transition-opacity duration-300"
    :class="visible ? 'opacity-100' : 'opacity-0'"
    style="color: var(--slidev-theme-foreground)"
    :url="url"
  />
</template>
