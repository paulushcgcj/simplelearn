<script setup lang="ts">
import Header from '@/components/AppHeader.vue'
import Footer from '@/components/AppFooter.vue'
</script>

<template>
  <div class="main-app">
    <Header />
    <main>
      <router-view />
    </main>
    <Footer />
  </div>
</template>

<style scoped>
.main-app {
  min-height: 100dvh;
  display: grid;
  grid-template-rows: auto 1fr auto;
}
</style>
