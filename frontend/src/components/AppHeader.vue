<template>
  <header>
    <nav>
      <router-link to="/">Home</router-link>
      <router-link to="/companies">Companies</router-link>
      <router-link to="/about">About</router-link>
    </nav>
  </header>
</template>

<script setup lang="ts"></script>

<style scoped>
header {
  background: #333;
  color: #fff;
  padding: 1em;
  display: flex;
  justify-content: center;
}

nav a {
  color: #fff;
  margin-right: 1em;
  text-decoration: none;
}

nav a:hover {
  text-decoration: underline;
}
</style>
