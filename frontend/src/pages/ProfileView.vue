<script setup lang="ts">
defineProps({
  msg: String
})
</script>

<template>
  <h1>{{ msg }}</h1>  
  <p> Params: {{ $route.params.msg }}</p>
  <p> Query: {{ $route.query.name }}</p>
</template>

<style scoped>
</style>
