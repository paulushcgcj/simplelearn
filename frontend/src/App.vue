<script setup lang="ts">
import Header from '@/components/AppHeader.vue'
import Footer from '@/components/AppFooter.vue'
</script>

<template>
  <div id="app" class="flex-col">
    <Header />
    <main>
      <router-view />
    </main>
    <Footer />
  </div>
</template>

<style scoped>
#app {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

main {
  flex: 1;
  padding: 2em;
}
</style>
