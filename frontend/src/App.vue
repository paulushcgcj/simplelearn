<script setup lang="ts">
import HelloWorld from './components/HelloWorld.vue'
</script>

<template>
  <nav>
    <RouterLink to="/">Go to Home</RouterLink> &nbsp;
    <RouterLink to="/about">Go to About</RouterLink> &nbsp;
    <RouterLink :to="{ name:'profile', params:{ msg:'Listen kin' }, query:{name:'Yuji'} }">Profile</RouterLink>
  </nav>
  <main>
    <RouterView />
  </main>
</template>

<style scoped>
</style>
