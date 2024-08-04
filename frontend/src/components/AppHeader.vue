<template>
  <header>
    <nav>
      <input type="checkbox" id="sidebar-active" />
      <label for="sidebar-active" class="open-sidebar-button">
        <svgMenu class="svg" />
      </label>

      <label id="overlay" for="sidebar-active"></label>
      <div class="links-container">
        <label for="sidebar-active" class="close-sidebar-button">
          <svgClose class="svg" />
        </label>

        <router-link to="/" class="home-link">Home</router-link>
        <router-link to="/companies">Companies</router-link>
        <router-link to="/about">About</router-link>
      </div>
    </nav>
  </header>
</template>

<script setup>
import svgMenu from '@/assets/menu_icon.svg'
import svgClose from '@/assets/close_icon.svg'
</script>

<style scoped>
header {
  position: sticky;
  top: 0;
}
nav {
  height: 60px;
  background-color: var(--secondary-color);
  display: flex;
  justify-content: flex-end;
  align-items: center;
}
.links-container {
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
}
nav a {
  height: 100%;
  padding: 0 20px;
  display: flex;
  align-items: center;
  text-decoration: none;
  color: var(--primary-color);
}
nav a:hover {
  background-color: var(--supplementary-color);
  color: var(--tertiary-color);
}
nav .home-link {
  margin-right: auto;
}
nav .svg {
  fill: var(--primary-color);
}
#sidebar-active {
  display: none;
}
.open-sidebar-button,
.close-sidebar-button {
  display: none;
}

@media (max-width: 450px) {
  .links-container {
    flex-direction: column;
    align-items: flex-start;
    position: fixed;
    top: 0;
    right: -100%;
    z-index: 10;
    width: 300px;
    background-color: var(--secondary-color);
    box-shadow: -5px 0 5px rgba(0, 0, 0, 0.25);
    transition: 0.75s ease-out;
  }
  nav a {
    box-sizing: border-box;
    height: auto;
    width: 100%;
    padding: 20px 30px;
    justify-content: flex-start;
  }
  .open-sidebar-button,
  .close-sidebar-button {
    padding: 20px;
    display: block;
  }
  #sidebar-active:checked ~ .links-container {
    right: 0;
  }
  #sidebar-active:checked ~ #overlay {
    height: 100%;
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 9;
  }
}
</style>
